// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.
//

import Foundation
import WebKit

public typealias WebRequestFilterType = ((String)->Bool)?   // url -> true:Blocked
public typealias WebFailureHandlerType = ((String)->Void)?   // url
public typealias WebOKHandlerType = ((String,String)->Void)?  // url ,body

class SimpleWebBrower: WKWebView, WKNavigationDelegate {
    
    public override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        self.navigationDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(frame: CGRect, configuration: WKWebViewConfiguration,
                successHandler: WebOKHandlerType,
                failedHandler: WebFailureHandlerType) {
        super.init(frame: frame, configuration: configuration)
        self.navigationDelegate = self
    }
    
    /// webView delegate
    // MARK: - 読み込み設定（リクエスト前）
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }

    // MARK: - 読み込み準備開始
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // 読み込み準備開始
    }

    // MARK: - 読み込み設定（レスポンス取得後）
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }

    // MARK: - 読み込み開始
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    }

    // MARK: - ユーザ認証（このメソッドを呼ばないと認証してくれない）
    func webView(_ webView: WKWebView,
                 didReceive challenge: URLAuthenticationChallenge,
                 completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // ユーザ認証
        completionHandler(.useCredential, nil)
    }

    // MARK: - 読み込み完了
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }

    // MARK: - 読み込み失敗検知
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError: Error) {
    }

    // MARK: - 読み込み失敗
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError: Error) {
        // 読み込み失敗
    }

    // MARK: - リダイレクト
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation:WKNavigation!) {
        // リダイレクト Redirect
    }
    /// webView delegate  end 20191126
}
