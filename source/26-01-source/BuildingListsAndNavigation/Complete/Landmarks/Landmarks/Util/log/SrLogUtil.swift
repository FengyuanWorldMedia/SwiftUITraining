// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

//2. For debugging purpose, it is better if you can include following information.
//- For request:
//      • Accessed URL
//      • Header information
//      • Request body
//- For response:
//      * HTTP status
//      * Header information
//      * Response body

public class SrLogUtil {
    
   private static let patternError = "[Sr] ERROR %@"
   private static let patternInfo  = "[Sr] INFO %@"
    
   public class func logInfo(string: String, parameters: String?...) {
//        if SrSdkConfig.isStaging {
           let logcontent = formatLogString(string: string, parameters: parameters)
            NSLog(patternInfo, logcontent)
//        }
   }
   
   public class func logError(string: String, parameters: String?...) {
//        if SrSdkConfig.isStaging {
           let logcontent = formatLogString(string: string, parameters: parameters)
            NSLog(patternError, logcontent)
//        }
   }
    
    class func formatLogString(string: String, parameters:[String?]) -> String {
        var logcontent = string
        for p in parameters {
          if p != nil {
            logcontent = logcontent.replacingFirstOccurrence(of: "%@", with: p!)
          }
         }
        return logcontent
     }
}
