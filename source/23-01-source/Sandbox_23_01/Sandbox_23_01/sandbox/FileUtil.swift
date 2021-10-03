// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import SwiftUI
//    iOS App SandBox
//    ├── Documents
//    ├── Library
//    │   ├── Caches
//    │   │    ├── private/images/
//    │   │    ├── private/text/
//    │   │    ├── private/db/database.sqllite
//    │   └── Preferences
//    └── tmp

public class FileUtil {
    
    // database name
    internal static var dbName    : String = "database.sqlite"
    internal static let BasePath  : String = String.cacheDir() + "/private"
    internal static let DbPath    : String = BasePath + "/db"
    public static let ImagePath   : String = BasePath + "/images"
    public static let TextPath    : String = BasePath + "/text"
    
    
    public static func writeImageToFile(image: UIImage, fileName: String) -> Bool {
        if !createDirectory(path: ImagePath) {
            return false
        }
        let filePath = ImagePath + "/" + fileName
        if !fileExists(filePath) && !createFile(ImagePath, fileName) {
            return false
        }
        let data = image.pngData()
        do {
            try data!.write(to: URL(fileURLWithPath: filePath))
        } catch {
            print("*** error: writeImageToFile failed \(error.localizedDescription)")
            _ = deleteFile(ImagePath + "/" + fileName)
            return false
        }
        return true
    }
    
    public static func writeImageToFile(imgAndFileName: [UIImage: String]) -> Bool {
        if !createDirectory(path: ImagePath) {
            return false
        }
        var ret = true
        var failedIndex = 0
        let indexRange = 0..<imgAndFileName.count
        
        imgAndFileName.forEach { item in
            
            // For test
//            if failedIndex == 2 {
//                ret = false
//                return
//            }
            
            let pathName = ImagePath + "/" + item.value
            if !fileExists(pathName) && !createFile(pathName) {
                ret = false
                return
            }
            let data = item.key.pngData()
            do {
                try data!.write(to: URL(fileURLWithPath: pathName))
            } catch {
                print("*** error: writeImageToFile failed \(error.localizedDescription)")
                ret = false
                return
            }
            failedIndex += 1
        }
        
        // Delete images that have been written
        if !ret {
            for index in indexRange {
                if index >= failedIndex {
                    break
                }
                _ = deleteFile(ImagePath + "/" + Array(imgAndFileName)[index].value)
            }
        }
        return ret
    }

    public static func getImage(fileName: String) -> UIImage? {
        let manager = FileManager.default
        let fileURL = URL(fileURLWithPath: ImagePath + "/" + fileName)
        var image: UIImage? = nil
        if manager.fileExists(atPath: fileURL.path) {
            do{
                let data = try Data.init(contentsOf: fileURL)
                image = UIImage(data: data)
            } catch {
                return nil
            }
        }
        return image
    }
    
    public static func getAllImages() -> [UIImage] {
        var imgs : [UIImage] = []
        let manager = FileManager.default
        if !manager.fileExists(atPath: ImagePath) {
            return imgs
        }
        let folderUrl = URL(fileURLWithPath: ImagePath)
        do {
            let imgUrls = try manager.contentsOfDirectory(at: folderUrl,
                                                    includingPropertiesForKeys: nil)
            for url in imgUrls {
                if manager.fileExists(atPath: url.path) {
                   let data = try Data.init(contentsOf: url)
                   let image = UIImage(data: data)
                   imgs.append(image!)
                }
            }
        } catch {
            imgs = []
            print("Error while enumerating files \(folderUrl.path): \(error.localizedDescription)")
        }
        return imgs
    }
    
    // return value is a tuple:
    // first value is the image that finded
    // second value is the array of failed image name
    public static func getImage(_ fileNames: [String]) -> ([UIImage], [String]) {
        let manager = FileManager.default
        var images: [UIImage] = []
        var failedNames: [String] = []
        
        fileNames.forEach { item in
            let fileURL = URL(fileURLWithPath: ImagePath + "/" + item)
            if !manager.fileExists(atPath: fileURL.path) {
                failedNames.append(item)
            } else {
                do{
                    let data = try Data.init(contentsOf: fileURL)
                    images.append(UIImage(data: data)!)
                } catch {
                    failedNames.append(item)
                }
            }
        }
        return (images, failedNames)
    }
    
//    public static func writeStringToFile(context: String, fileName: String) -> Bool {
//        if !createDirectory(path: TextPath) {
//            return false
//        }
//        let filePath = TextPath + "/" + fileName
//        if !fileExists(filePath) && !createFile(TextPath, fileName) {
//             return false
//        }
//        let fileURL = URL(fileURLWithPath: filePath)
//        do {
//            try context.write(to: fileURL, atomically: true, encoding: .utf8)
//        } catch {
//            return false
//        }
//        return true
//    }
    
    public static func writeStringToFile(context: String, fileFullPath: String) -> Bool {
        if !fileExists(fileFullPath) && !createFile(fileFullPath) {
             return false
        }
        let fileURL = URL(fileURLWithPath: fileFullPath)
        do {
            try context.write(to: fileURL, atomically: false, encoding: .utf8)
        } catch {
            return false
        }
        return true
    }

    
    public static func writeStringToFile(context: [String: String]) -> Bool {
        if !createDirectory(path: TextPath) {
            return false
        }
        var ret = true
        context.forEach { item in
            if !writeStringToFile(context: item.key, fileFullPath: TextPath + "/" + item.value) {
                ret = false
                return
            }
        }
        return ret
    }
    
//    // for simplified use, if failed, return empty string!!!
//    public static func getFileText(fileName: String) -> String {
//        let manager = FileManager.default
//        let fileURL = URL(fileURLWithPath: TextPath + "/" + fileName)
//        var data: String = ""
//        if manager.fileExists(atPath: fileURL.path) {
//            do {
//                data = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
//            } catch {
//                return ""
//            }
//        }
//        return data
//    }
    
    public static func getFileText(_ fileName: String, _ text: inout String) -> Bool {
        let manager = FileManager.default
        let fileURL = URL(fileURLWithPath: TextPath + "/" + fileName)
        if !manager.fileExists(atPath: fileURL.path) {
            return false
        }
        do {
            text = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
        } catch {
            return false
        }
        return true
    }
    
    public static func deleteFile(_ fileFullPath: String) -> Bool {
        let manager = FileManager.default
        let fileURL = URL(fileURLWithPath: fileFullPath)
        if manager.fileExists(atPath: fileURL.path) {
            do {
                try manager.removeItem(at: fileURL)
            } catch {
                return false
            }
        }
        return true
    }
    
    // Return a tuple:
    // If success, first value is true, otherwise first value is false
    // Second value is a array that contains the failed fileName
    public static func deleteFile(_ fileNames: [String]) -> (Bool, [String]) {
        var ret     = true
        var failedFile: [String] = []
        let manager = FileManager.default
        if !manager.fileExists(atPath: ImagePath) {
            return (false, failedFile)
        }
        fileNames.forEach { item in
            let fileURL = URL(fileURLWithPath: ImagePath + "/" + item)
            if manager.fileExists(atPath: fileURL.path) {
                do {
                    try manager.removeItem(at: fileURL)
                } catch {
                    ret = false
                    failedFile.append(item)
                }
            }
        }
        return (ret, failedFile)
    }
    
    private static func createDirectory(path : String) -> Bool {
        let fileManger = FileManager.default
        if !fileManger.fileExists(atPath: path) {
            do {
                try fileManger.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("*** error: createDirectory failed \(error.localizedDescription)")
                return false
            }
        }
        return true
    }
    
      /// create file
      ///
      /// - Parameter folderPath
      /// - Parameter fileName
      /// - Returns: Bool
    private static func createFile(_ folderPath : String, _ fileName: String) -> Bool {
        let fileManger = FileManager.default
        let fileFullPath = folderPath + "/" + fileName
        if !fileManger.fileExists(atPath: fileFullPath) {
            let isSuccess = fileManger.createFile(atPath: fileFullPath, contents: nil, attributes: nil)
            return isSuccess
        } else {
           print("\(fileFullPath) exists.")
        }
        return false
    }
    
    private static func createFile(_ fileFullPath: String) -> Bool {
        let fileManger = FileManager.default
        if !fileManger.fileExists(atPath: fileFullPath) {
            let isSuccess = fileManger.createFile(atPath: fileFullPath, contents: nil, attributes: nil)
            return isSuccess
        } else {
           print("\(fileFullPath) exists.")
        }
        return false
    }
    
    /// Check file
    ///
    /// - Returns: true: exist
    /// -                     false:not exist
    private static func fileExists(_ fileFullPath: String) -> Bool {
        return FileManager.default.fileExists(atPath: fileFullPath)
    }
    
    /// Get file size
    ///
    /// - Returns: file size(byte)
    public static func getFileSize(_ fileFullPath: String) -> Double {
        let fileManger = FileManager.default
        guard fileExists(fileFullPath) else {
            return 0
        }
        let attr = try! fileManger.attributesOfItem(atPath: fileFullPath)
        let fileSize = Double((attr as NSDictionary).fileSize())
        return fileSize
    }
    
    internal static func createAppDirectory() -> Bool {
        if !createDirectory(path: TextPath) {
            return false
        }
        if !createDirectory(path: DbPath) {
            _ = deleteFile(TextPath)
            return false
        }
        if !createDirectory(path: ImagePath) {
            _ = deleteFile(TextPath)
            _ = deleteFile(DbPath)
            return false
        }
        return true
    }
    
    /// paramter ： NSHomeDirectory() + "/document/xxxxx"
    /// 如果是文件夹，则返回true，不存在返回nil，是文件返回 false
    public static func isFolder(_ path: String) -> Bool? {
            let manager = FileManager.default
            if !manager.fileExists(atPath: path) {
                return nil
            }
            var isDir: ObjCBool = false
            if manager.fileExists(atPath: path, isDirectory: &isDir) {
                return isDir.boolValue
            } else {
                return nil
            }
        }
}
