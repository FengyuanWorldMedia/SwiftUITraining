// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.
// https://github.com/Alamofire/Alamofire/blob/master/Documentation/AdvancedUsage.md#session-manager

import Foundation
import Alamofire
import UIKit

public class SrWebApi {
     /// Client Error 408 Request Timeout
     public static let CLIENT_REQUEST_TIMEOUT : Int = 408
         
     /// Timeout interval (second)
     public static let TIMEOUT_INTERVAL : TimeInterval = 30
    
      /// Sr-HttpPost Common Component.
      /// - Parameters:
      ///   - webApi: webApi
      ///   - parameters: parameters
      ///   - successHandler: successHandler
      ///   - errorHandler: errorHandler
     public class func doPost<P:Codable, Q:Codable>(webApi: SrWebApiEnum,
                                    parameter: P,
                                    resType:Q.Type?,
                                    successHandler: @escaping (Q?) -> Void,
                                    errorHandler: @escaping ([SrErrorMsgObject]?) -> Void) {
          
             let request = getURLRequest(url:webApi.url, parameter:parameter)
          
              AF.request(request).responseString(encoding:.utf8) {
                    response in
                    
                   webApiLog(request:request ,response: response)
                    
                   let httpStatusCode = response.response?.statusCode ?? CLIENT_REQUEST_TIMEOUT
                   let status = getNetError(statusCode: httpStatusCode)
                   
                   switch status {
                        case .OK:
                             let jsonStrVal = response.value
                             if SrStringUtil.isEmptyOrNil(jsonStrVal) {
                                errorHandler(createErrorObjects(type: "Server",
                                                                 code: "987" ,
                                                                 msg : "No Response Json data"))
                             } else {
                                let response : SrCommonResponse<Q>?
                                                = SrJsonUtil.parseStrToJson(jsonStrVal!, as: SrCommonResponse<Q>.self)
                                if response == nil {
                                    errorHandler(createErrorObjects(type: "Server",
                                                                    code: "987" ,
                                                                    msg : "Response Json data format error"))
                                } else if response?.header.stat == SrHeaderStatus.OK.rawValue {
                                    successHandler(response?.data)
                                } else if response?.header.stat == SrHeaderStatus.NG.rawValue {
                                    errorHandler(response?.header.msgObjs)
                                } else {
                                    errorHandler(createErrorObjects(type: "Server",
                                                                    code: "987" ,
                                                                    msg : "Response Json header-stat neither NG nor OK"))
                                }
                             }
                        default :
                            errorHandler(createErrorObjects(type: "clinet",
                                                            code: String(httpStatusCode) ,
                                                            msg: getHttpErrInfo(statusCode: httpStatusCode)))
                   }
             }
    }
    
    
    private class func getURLRequest<P:Codable>(url:String, parameter:P?) -> URLRequest {
        var request = URLRequest(url: NSURL.init(string:url)! as URL)
        request.timeoutInterval = SrWebApi.TIMEOUT_INTERVAL
        request.headers = SrWebApi.getHeaders()
        request.method  = .post
        var requestData : SrCommonRequest<P> = SrCommonRequest()
        requestData.header = SrWebApi.getHeader()
        requestData.data   = parameter
        let jsonData = SrJsonUtil.parseJsonToData(requestData)
        request.httpBody = jsonData!
        return request
    }
    
    private class func getHeader() -> SrRequestHeader {
        var header = SrRequestHeader()
        header.device        = "xx device"
        header.uuid          = "xx uuid"
        header.platform_name = "xx platform_name"
        header.user_agent    = "xx user_agent_userid" // userID included.
        header.token_id      = "xx token_id"
        return header
    }
    
    private class func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "api-version": SrServerConstants.apiVersion.rawValue,
            "Accept": "application/json",
            "Content-Type": "application/json",
            "User-Agent": getUserAgent()
        ]
        return headers
    }
    
    internal class func getUserAgent() -> String {
        var userAgent = SrServerConstants.userAgentBaseStringBase.rawValue + ";"
        userAgent = userAgent + UIDevice.current.systemName + ";" + UIDevice.current.systemVersion
        return userAgent
    }
    
     /// WebApi Log
    /// - Parameter response: HttpResponse
    private static func webApiLog(request:URLRequest ,response :AFDataResponse<String>?) {
        // Request Data Log
        SrLogUtil.logInfo(string: "Request URL: %@", parameters: request.url?.absoluteString)
        SrLogUtil.logInfo(string: "Request Header: %@", parameters: request.headers.description)
        if let httpReqBody = request.httpBody {
            if SrSdkConfig.isStaging {
                let reqHttpBody = String(data: httpReqBody, encoding: String.Encoding.utf8)
                logLargeString(reqHttpBody ?? "",.Request)
            }
        } else {
             SrLogUtil.logInfo(string: "Request Body: %@", parameters:  "")
        }
        if let response = response {
            // Reponse Data Log
            SrLogUtil.logInfo(string: "Response HttpStatus Code: %@", parameters: String(response.response?.statusCode ?? CLIENT_REQUEST_TIMEOUT))
            SrLogUtil.logInfo(string: "Response Header: %@", parameters: response.response?.headers.description ?? "")
            if let data = response.data {
                if SrSdkConfig.isStaging {
                    let dataStr = String(data: data, encoding: .utf8) ?? ""
                    logLargeString(dataStr,.Response)
                }
            } else {
                SrLogUtil.logInfo(string: "Response Body:")
            }
        }
    }
    
    static func logLargeString(_ dataStr: String, _ logType:SrRequestResponseEnum) {
          let ChunkSize : Int = 900
          let strLength = dataStr.count
          if strLength <= ChunkSize {
             SrLogUtil.logInfo(string: "\(logType.rawValue) Body: %@", parameters: dataStr)
             return
          }
          var steps = 0
          steps = strLength / ChunkSize
          var isBlock = false
          if strLength % ChunkSize == 0 {
             isBlock = true
          }
          for i in 0..<steps {
              let range = i*ChunkSize..<((i+1)*ChunkSize)
              let res = dataStr.substring(range: range)
              SrLogUtil.logInfo(string: "\(logType.rawValue) Body:: part (\(i)): %@", parameters: res)
          }
          if !isBlock {
              let range = steps*ChunkSize..<strLength
              let res = dataStr.substring(range: range)
              SrLogUtil.logInfo(string: "\(logType.rawValue)  Body:: part (\(steps)): %@", parameters: res)
          }
      }
     
     /// Description: Get NetError
     /// - Parameter statusCode: statusCode
     /// - https://ja.wikipedia.org/wiki/HTTPステータスコード
     private static func getNetError(statusCode : Int) -> SrDucAccessError {
         switch statusCode {
         case 200:
             return SrDucAccessError.OK
         case 408:
             return SrDucAccessError.ClientRequestTimeout
         case 503:
             return SrDucAccessError.ServiceUnavailable
         default:
             return SrDucAccessError.Other
         }
     }
    
    /// Get Http Error Infomation
    /// - Parameter statusCode: Http Status Code
    private static func getHttpErrInfo(statusCode : Int) -> String {
        switch statusCode {
        case 408:
            return SrMsg.HTTP_MSG_408
        case 503:
            return SrMsg.HTTP_MSG_503
        default:
            return SrMsg.HTTP_MSG_REQUEST_ERROR
        }
    }
    
    public static func createErrorObjects(type: String , code :String , msg : String) -> [SrErrorMsgObject] {
        var errorObj  = SrErrorMsgObject()
        errorObj.type = type
        errorObj.code = code
        errorObj.msg  = msg
        return [errorObj]
    }
     
    /// 20200729 liuqingshang
    private class func getURLRequestGetMethod(url:String) -> URLRequest {
        var request = URLRequest(url: NSURL.init(string:url)! as URL)
        request.timeoutInterval = SrWebApi.TIMEOUT_INTERVAL
        request.headers = SrWebApi.getHeaders()
        request.method = .get
        return request
    }
    
       /// 20200729 liuqingshang
      class func doGetJsonWithoutParam<P:Codable>(url: SrHttpLinkEnum,
                                         successHandler: @escaping (P) -> Void,
                                         errorHandler: @escaping ([SrErrorMsgObject]?) -> Void) {
           let request = getURLRequestGetMethod(url:url.rawValue)
           AF.request(request).responseString(encoding:.utf8) {
                response in
                webApiLog(request:request ,response: response)
                let httpStatusCode = response.response?.statusCode ?? CLIENT_REQUEST_TIMEOUT
                let status = getNetError(statusCode: httpStatusCode)
                switch status {
                     case .OK:
                           var responseString = ""
                           if let data = response.data {
                               responseString = String(data: data, encoding: .utf8) ?? ""
                           }
                           if responseString == "" {
                              let errObjs = createErrorObjects(type: "Server",
                                                            code: String(httpStatusCode) ,
                                                            msg: getHttpErrInfo(statusCode: httpStatusCode))
                              errorHandler(errObjs)
                           } else {
                              let responseData: P? = SrJsonUtil.parseStrToJson(responseString)
                              successHandler(responseData!)
                           }
                     default :
                           let errObjs = createErrorObjects(type: "Server",
                                                             code: String(httpStatusCode) ,
                                                             msg: getHttpErrInfo(statusCode: httpStatusCode))
                           errorHandler(errObjs)
                }
          }
     }
    
      /// 20200729 liuqingshang
     class func doGetBinaryData(url: String,
                                successHandler: @escaping (Data) -> Void,
                                processHandler: @escaping (Double) -> Void,
                                errorHandler: @escaping ([SrErrorMsgObject]?) -> Void) {
          let request = getURLRequestGetMethod(url:url)
          AF.request(request).response {
               response in
               webApiLog(request:request ,response : nil)
               let httpStatusCode = response.response?.statusCode ?? CLIENT_REQUEST_TIMEOUT
               let status = getNetError(statusCode: httpStatusCode)
               switch status {
                    case .OK:
                       if let data = response.data {
                           successHandler(data)
                           SrLogUtil.logInfo(string: "Response Body:Binary data")
                       } else {
                           let errObjs = createErrorObjects(type: "Server",
                                                          code: String(httpStatusCode) ,
                                                          msg: getHttpErrInfo(statusCode: httpStatusCode))
                           errorHandler(errObjs)
                           SrLogUtil.logInfo(string: "Response Body:No reponse data")
                       }
                    default :
                        let errObjs = createErrorObjects(type: "Server",
                                                          code: String(httpStatusCode) ,
                                                          msg: getHttpErrInfo(statusCode: httpStatusCode))
                        errorHandler(errObjs)
                        SrLogUtil.logInfo(string: "Response Error:\(Int64(httpStatusCode)) : \(getHttpErrInfo(statusCode: httpStatusCode))")
               }
         }.downloadProgress(closure: {
               progress in
               processHandler(progress.fractionCompleted)
               // REdyLogUtil.logInfo(string: "Download Progress: \(progress.fractionCompleted)")
         })
    }
    
}


// DucAccessError
public enum SrDucAccessError: Error {
    case OK
    case ServiceUnavailable
    case ClientRequestTimeout
    case BusinessError
    case Other
}

// ResponseHeader Status Result : OK or NG
public enum SrHeaderStatus : String {
    case OK = "OK"
    case NG = "NG"
}
public enum SrRequestResponseEnum : String {
    case Request = "Request"
    case Response = "Response"
}
