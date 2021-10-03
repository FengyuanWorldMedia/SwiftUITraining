// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

public struct SrMsg {
    public static let TITLE_ERROR : String = "エラー"
    
    // HTTP系エラー
    public static let HTTP_MSG_408: String = "通信設定、電波状態などを確認して再度実行してください。"
    public static let HTTP_MSG_503: String = "ただいまシステムメンテナンス中です。\nお客様にはご不便をおかけいたしますが、何卒ご理解いただきますようお願い申し上げます。"
    public static let HTTP_MSG_REQUEST_ERROR: String =  "リクエストエラー"
    
    // replace error message
    public static func msgMapping(errorCode: Int64, errorMsg: String) -> String {
        
        return SrStringUtil.replaceHtmlTag(html:errorMsg)
    }
}
