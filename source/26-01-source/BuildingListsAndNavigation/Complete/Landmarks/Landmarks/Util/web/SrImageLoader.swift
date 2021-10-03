// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import Alamofire
import UIKit

public class SrImageLoader {
    
    public static func loadImage(url : String,
                          successHandler: @escaping (UIImage) -> Void,
                          processHandler: @escaping (Double) -> Void,
                          errorHandler: @escaping () -> Void) {
        // Get picture from cache folder ,
        // TODO:
        SrWebApi.doGetBinaryData(url: url, successHandler: {
            binaryData in
            var image: UIImage?
            image =  UIImage.init(data: binaryData)
            if let image = image {
                successHandler(image)
            } else {
               errorHandler()
           }
        },
        processHandler:processHandler,
        errorHandler: {
            errObjs in
            errorHandler()
        })
    }
    
    public static func loadNSData(url : String,
                          successHandler: @escaping (NSData) -> Void,
                          processHandler: @escaping (Double) -> Void,
                          errorHandler: @escaping () -> Void) {
        // Get picture from cache folder ,
        // TODO:
        SrWebApi.doGetBinaryData(url: url, successHandler: {
            binaryData in
            var data: NSData?
            data = binaryData as NSData
            if let data = data {
                successHandler(data)
            } else {
               errorHandler()
           }
        },
        processHandler:processHandler,
        errorHandler: {
            errObjs in
            errorHandler()
        })
    }
    
    // let imageUrl = "http://192.168.3.251:8080/mock/webapi/file/download?file_id=8ca5321dc3206be28bb29afff3d14795"
    public static func loadImage(file_id : String,
                          successHandler: @escaping (UIImage) -> Void,
                          processHandler: @escaping (Double) -> Void,
                          errorHandler: @escaping () -> Void) {
        let imageUrl = SrBaseWebUrl.getDownloadImageUrl(file_id: file_id)
        SrLogUtil.logInfo(string: "imageUrl:\(imageUrl)")
        SrImageLoader.loadImage(url: imageUrl,
                              successHandler: successHandler,
                              processHandler:processHandler,
                              errorHandler: errorHandler)
    }
    
    public static func loadNSData(file_id : String,
                          successHandler: @escaping (NSData) -> Void,
                          processHandler: @escaping (Double) -> Void,
                          errorHandler: @escaping () -> Void) {
        let imageUrl = SrBaseWebUrl.getDownloadImageUrl(file_id: file_id)
        SrLogUtil.logInfo(string: "imageUrl:\(imageUrl)")
        SrImageLoader.loadNSData(url: imageUrl,
                              successHandler: successHandler,
                              processHandler:processHandler,
                              errorHandler: errorHandler)
    }
    
    /// getAllCardBgImage
       public class func getAllImage(cardBgImageNames : [String],
                                              successHandler: @escaping ([(name:String,image:UIImage)]) -> Void,
                                              errorHandler: @escaping ([(name:String,[SrErrorMsgObject]?)]) -> Void) {
            getAllImage(cardBgImageIds: cardBgImageNames,
                             successHandler: successHandler,
                             processHandler: {(_ ,_) in},
                             errorHandler: errorHandler)
       }
    /// getAllCardBgImage
      public class func getAllImage(cardBgImageIds : [String],
                                          successHandler: @escaping ([(name:String,image:UIImage)]) -> Void,
                                          processHandler: @escaping (String,Double) -> Void,
                                          errorHandler: @escaping ([(name:String,[SrErrorMsgObject]?)]) -> Void) {
              let queue = DispatchQueue(label: "getAllCardBgImage")
              let group = DispatchGroup()
              var downloadImgs : [(name:String,image:UIImage)]  = []
              var failureImgs : [(name:String,[SrErrorMsgObject]?)] = []
          
              for file_id in cardBgImageIds {
                  // Create an GetHttpMethod task to get all images.
                  queue.async(group: group) {
                      let sema = DispatchSemaphore(value: 0)
                      let imageUrl = SrBaseWebUrl.getDownloadImageUrl(file_id: file_id)
                      SrWebApi.doGetBinaryData(url: imageUrl,
                                      successHandler:
                                      { binaryData in
                                          var image: UIImage?
                                          image =  UIImage.init(data: binaryData)
                                          if let image = image {
                                             downloadImgs.append((name:file_id, image: image))
                                          } else {
                                            let errObjs = SrWebApi.createErrorObjects(type: "Server",
                                                                           code: String(404) ,
                                                                           msg: "Not image data")
                                            
                                             failureImgs.append((name:file_id,errObjs))
                                          }
                                          //finish single request task.
                                          sema.signal()
                                       },
                                      processHandler: { completeFraction in
                                          processHandler(file_id,completeFraction)
                                      },
                                      errorHandler: {
                                          errorObjects in
                                          failureImgs.append((name:file_id,errorObjects))
                                           //finish single request task.
                                          sema.signal()
                                      })
                      // next loop
                      sema.wait()
                  }
              }
              // execute success & failure handler.
              group.notify(queue: DispatchQueue.main, execute: {
                  if downloadImgs.count > 0 {
                      successHandler(downloadImgs)
                  }
                  if failureImgs.count > 0 {
                      errorHandler(failureImgs)
                  }
              })
      }
    
    
    
}
