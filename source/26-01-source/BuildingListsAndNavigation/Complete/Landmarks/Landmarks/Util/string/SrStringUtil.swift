// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

public class SrStringUtil {
    
    public static func toInteger(value:String) -> Int {
        return NSString(string:value).integerValue
    }
    
   public static func replaceHtmlTag(html :String?) -> String {
        if html != nil {
            return html!.replacingOccurrences(of: "<[b,B][r,R]\\s*/?>", with: "\n", options: .regularExpression)
                        .replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
        } else {
            return ""
        }
    }
    
    /// Intercepts a string from the specified content
      /// - Parameters:
      ///   - content: specified content
      ///   - beginIndex: begin Index
      ///   - length: Intercepts string length
     public static func subString(content:String, beginIndex:Int, length:Int) -> String{
          let strArray = Array(content)
          let subStrArray = strArray[beginIndex..<beginIndex + length ]
          let result = String(subStrArray)
          return result
      }
      
      /// Returns the first position of the specified substring in the specified content
      /// - Parameters:
      ///   - content: specified content
      ///   - substr: specified substring
      public static func firstIndexOf(content:String, substr:String) -> Int {
          let nsStr = NSString(string:content)
          let rng = nsStr.range(of:substr)
          return rng.location
      }
      
      /// Replace the target string in the specified string content
      /// - Parameters:
      ///   - content: specified string content
      ///   - target: target string
      ///   - replacement: replacement
     public static func replace(content:String, target:String, replacement:String) -> String{
          let nsStr = NSString(string:content)
          return nsStr.replacingOccurrences(of: target, with: replacement)
      }
    
     
     public static func isEmptyOrNil(_ content:String?) -> Bool{
         return content == nil || content?.count == 0
     }
    
    // ascending: 升序
    // FOR FILE SORT
    public static func sortDictionary(_ dictIn: [String: String], _ ascending: Bool = true) -> [(String, String)] {
        let dictSorted = dictIn.sorted {
            if ascending {
                return $0.key < $1.key
            } else {
                return $0.key > $1.key
            }
        }
        return dictSorted
    }
}
