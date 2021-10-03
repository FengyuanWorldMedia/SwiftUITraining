// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

public class SrBaseWebUrl {

//    private static let LOCAL_HOST_BASE_URL = "http://124.35.43.243:9999/sr/webapi/"
    private static let LOCAL_HOST_BASE_URL = "http://192.168.0.6:8080/mock/webapi/"
    
//    private static let RELEASE_BASE_URL = "http://124.35.43.243:9999/sr/webapi/"
    private static let RELEASE_BASE_URL = "http://192.168.0.6:8080/mock/webapi/"
    
    // private static let PRE_RELEASE_BASE_URL = "http://124.35.43.243:9999/sr/webapi/"
    
   private class func getBaseUrl() -> String {
      var baseUrl = ""
      if SrSdkConfig.isStaging {
         if UserDefaults.standard.bool(forKey: "enable_mock") {
              baseUrl = UserDefaults.standard.string(forKey: "mock_server_url")!
         } else {
            baseUrl = LOCAL_HOST_BASE_URL
         }
      } else {
         baseUrl = RELEASE_BASE_URL
      }
      return baseUrl
   } 
   
   internal class func createWebApiUrl(webapi: SrWebApiEnum) -> String {
          let baseUrl = getBaseUrl()
          var serverParam = ""
          if SrSdkConfig.isStaging && UserDefaults.standard.bool(forKey: "enable_mock") {
               serverParam = SrStringUtil.replace(content: webapi.rawValue, target: "/", replacement: "-")
               let testcase = UserDefaults.standard.string(forKey:"test_case_no") ?? "notestcase"
               serverParam = serverParam + "/" + testcase
          } else {
              serverParam = webapi.rawValue
          }
          
          return baseUrl + serverParam
      }
    
    //  http://60.113.24.101:8080/mock/webapi/file/download?file_id=8ca5321dc3206be28bb29afff3d14795
    // "http://192.168.3.251:8080/mock/webapi/file/download?file_id=8ca5321dc3206be28bb29afff3d14795"
    public class func getDownloadImageUrl(file_id: String) -> String {
          let baseUrl = getBaseUrl()
          let requestUrl = baseUrl + "file/download?file_id=" + file_id
          return requestUrl
    }
    
    // /mock/webapi/file/upload/multi
    internal class func getUploadImageUrl() -> String {
        let baseUrl = getBaseUrl()
        let requestUrl = baseUrl + "file/upload/multi"
        return requestUrl
    }
    
}
