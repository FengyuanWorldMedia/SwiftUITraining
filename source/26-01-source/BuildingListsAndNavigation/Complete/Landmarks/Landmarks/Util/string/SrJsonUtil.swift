// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

public class SrJsonUtil {

    /// load json from File  and parse the content to JsonObject
    /// - Parameter filename: file name
    /// - Parameter type: JsonObject Type
    public class func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
        let data: Data
    
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
    
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
    
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

    public class func loadTextFile(_ filename: String) -> String {
        let data: String
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            //fatalError("Couldn't find \(filename) in main bundle.")
            return ""
        }
        
        do {
            data = try String(contentsOf: file, encoding: String.Encoding.utf8)
        } catch {
            //fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
            return ""
        }
        return data
    }

    /// Parse String to JsonObject
    /// - Parameter jsonString: json string
    /// - Parameter type: json object type
    public class func parseStrToJsonShiftJIS<T: Codable>(_ jsonString: String, as type: T.Type = T.self) -> T? {
        do {
            let jsonData: Data? = jsonString.data(using: .shiftJIS)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: jsonData!)
        } catch {
            //fatalError("Couldn't parse \(jsonString) as \(T.self):\n\(error)")
            return nil
        }
    }
    
    /// Parse String to JsonObject
    /// - Parameter jsonString: json string
    /// - Parameter type: json object type
    public class func parseStrToJson<T: Codable>(_ jsonString: String, as type: T.Type = T.self) -> T? {
        do {
            let jsonData: Data? = jsonString.data(using: .utf8)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: jsonData!)
        } catch {
            //fatalError("Couldn't parse \(jsonString) as \(T.self):\n\(error)")
            return nil
        }
    }

    /// Description: Parse JsonObject to String
    /// - Parameter json: JsonObject
    public class func parseJsonToStr<T: Codable> (_ json: T ) -> String {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(json)
            if SrSdkConfig.isStaging {
                encoder.outputFormatting = .prettyPrinted
            }
            return String(data: jsonData, encoding: .utf8)!
        } catch {
            //fatalError("Couldn't parse JsonObject \(json.self) To String")
            return ""
        }
    }
    /// Description: Parse JsonObject to Data
    /// - Parameter json: JsonObject
    public class func parseJsonToData<T: Codable> (_ json: T ) -> Data? {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(json)
            return jsonData
        } catch {
            // fatalError("Couldn't parse JsonObject \(json.self) To Data")
            return nil
        }
    }
}
