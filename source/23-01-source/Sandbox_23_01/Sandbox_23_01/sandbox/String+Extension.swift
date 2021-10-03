// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

// Commonly used directories of an iOS app
// 1.AppName.app
//  This is the app’s bundle. This directory contains the app and all of its resources.
//  You cannot write to this directory. To prevent tampering, the bundle directory is signed at installation time. Writing to this directory changes the signature and prevents your app from launching. You can, however, gain read-only access to any resources stored in the apps bundle. For more information, see the Resource Programming Guide
//  The contents of this directory are not backed up by iTunes or iCloud. However, iTunes does perform an initial sync of any apps purchased from the App Store.

// 2.Documents/
// Use this directory to store user-generated content. The contents of this directory can be made available to the user through file sharing; therefore, this directory should only contain files that you may wish to expose to the user.
// The contents of this directory are backed up by iTunes and iCloud.

// 3.Documents/Inbox
// Use this directory to access files that your app was asked to open by outside entities. Specifically, the Mail program places email attachments associated with your app in this directory. Document interaction controllers may also place files in it.
// Your app can read and delete files in this directory but cannot create new files or write to existing files. If the user tries to edit a file in this directory, your app must silently move it out of the directory before making any changes.
// The contents of this directory are backed up by iTunes and iCloud.

// 4.Library/
// This is the top-level directory for any files that are not user data files. You typically put files in one of several standard subdirectories. iOS apps commonly use the Application Support and Caches subdirectories; however, you can create custom subdirectories.
// Use the Library subdirectories for any files you don’t want exposed to the user. Your app should not use these directories for user data files.
// The contents of the Library directory (【with the exception of the Caches subdirectory】) are backed up by iTunes and iCloud.
// For additional information about the Library directory and its commonly used subdirectories, see The Library Directory Stores App-Specific Files.
// Library/Preference：Save all your app’s preferences, and the iOS Settings app will look up the app’s settings in that directory。iTunes
// Using NSUserDefault for reading and writing.

// 5.tmp/
// Use this directory to write temporary files that do not need to persist between launches of your app. Your app should remove files from this directory when they are no longer needed; however, the system may purge this directory when your app is not running.
// The contents of this directory are not backed up by iTunes or iCloud.


extension String {
    
    // MARK: 1.Return the home absolute path.
    /**
       *  1.Return the home absolute path.
       */
    static func homeDir() -> String {
        let homeDirectory = NSHomeDirectory()
        return homeDirectory
    }
    
    // MARK: 2.Return the Cache absolute path.
    /**
       *  2.Return the Cache absolute path.
       */
    static func cacheDir() -> String {
    
        // Method 1
        /*
            let cachePaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            //let cachePath = cachePaths.last
            let cachePath = cachePaths[0]
            return cachePath
        */
    
        //Method 2
        let cachePath2 = NSHomeDirectory() + "/Library/Caches"
        return cachePath2
    }
    // MARK: 3.Return the Documnets absolute path.
    /**
       *  3.Return the Documnets absolute path.
       */
    static func DocumnetsDir() -> String {
        //Method 1
        // let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        // let documnetPath = documentPaths[0]
    
        //Method 2
        let ducumentPath = NSHomeDirectory() + "/Documents"
        return ducumentPath
    }

    // MARK: 4.Return the Library absolute path.
    /**
       * 4.Return the Library absolute path.
        SubFolders：Caches And Preferences
           Library/Preferences
           Library/Caches
       */
    static func LibraryDir() -> String {
        // Method 1
        // let libraryPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        // let libraryPath = libraryPaths[0]
        //
        // Method 2
        let libraryPath = NSHomeDirectory() + "/Library"
        return libraryPath
    }

    // MARK: 5.Return the Tmp absolute path.
    /**
       *  5.Return the Tmp absolute path.
       */
    static func TmpDir() -> String {
        // Method 1
        // let tmpDir = NSTemporaryDirectory()
        
        // Method 2
        let tmpDir = NSHomeDirectory() + "/tmp"
        return tmpDir
    }
    
    public func replacingFirstOccurrence(of target: String, with replacement: String) -> String {
        guard let range = self.range(of: target) else { return self }
        return self.replacingCharacters(in: range, with: replacement)
    }
    
    //    func convertUnicode() -> String {
    //        return replacingOccurrences(
    //            of: "\\\\U([0-9a-z]{4,5})",
    //             with:  "\\\\u{$1}",
    //            options: .regularExpression,
    //            range: self.range(of: self))
    //    }
    public func substring (range: Range<Int>) -> String {
        return String(
            self[self.index(self.startIndex, offsetBy: range.lowerBound)..<self.index(self.startIndex, offsetBy: range.upperBound)]
        )
    }
    
    public func insert(with separator: String, every n: Int) -> String {
        return String(stride(from: 0, to: Array(self).count, by: n).map {
            Array(Array(self)[$0..<min($0 + n, Array(self).count)])
        }.joined(separator: separator))
    }
}
