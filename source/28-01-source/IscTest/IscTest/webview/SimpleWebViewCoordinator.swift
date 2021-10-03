// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.
//
import Foundation
import SwiftUI
import WebKit

struct SimpleWebViewCoordinator: UIViewRepresentable {
    var urlRequest: URLRequest
    var javascript: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        /// javascript injection
        if javascript != nil && javascript!.count > 0 {
            // let userScript = WKUserScript(source: javascript!, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
            let userScript = WKUserScript(source: javascript!, injectionTime: .atDocumentStart, forMainFrameOnly: true)
            let userContentController = WKUserContentController()
            userContentController.addUserScript(userScript)
            configuration.userContentController = userContentController
        }
        let webView = SimpleWebBrower(frame: .zero, configuration: configuration)
        let req = self.urlRequest
        webView.load(req)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        //  let req = self.urlRequest
        //  uiView.load(req)
    }
}
