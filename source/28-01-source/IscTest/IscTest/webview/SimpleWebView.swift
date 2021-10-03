// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import SwiftUI
import Alamofire

public struct SimpleWebView: View {
    
   var httpLink: HttpLinkEnum?
    var linkStr = ""
   var title: String
   var jsScript: String?
   
   public init(httpLink: HttpLinkEnum, title:String = "",  jsScript: String = "") {
        self.httpLink = httpLink
        self.title = title
        self.jsScript = jsScript
   }
    public init(httpStr: String , title:String = "",  jsScript: String = "") {
         self.linkStr = httpStr
         self.title = title
         self.jsScript = jsScript
    }
   
   public var body: some View {
      VStack {
          SimpleWebViewCoordinator(urlRequest:self.getURLRequest(), javascript: self.jsScript)
      }.navigationBarTitle(Text(self.title), displayMode: .inline)
      .edgesIgnoringSafeArea(.bottom)
    }
    
    private func getURLRequest() -> URLRequest {
        var request: URLRequest?
        if httpLink != nil {
            request = URLRequest(url: NSURL.init(string: self.httpLink!.rawValue)! as URL)
        } else {
            request = URLRequest(url: NSURL.init(string: linkStr)! as URL)
        }
        request!.httpMethod = HTTPMethod.get.rawValue
        return request!
    }
}



public enum HttpLinkEnum: String {
    public typealias RawValue = String
    #if DEBUG
        case TestURL = "https://baidu.com"
    #else
        case TestURL = "https://baidu.com"
    #endif
    case None = ""
}
