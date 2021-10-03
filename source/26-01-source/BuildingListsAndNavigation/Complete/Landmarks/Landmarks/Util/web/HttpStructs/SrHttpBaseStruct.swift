// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

struct SrRequestHeader : Codable {
    var device : String
    var uuid : String
    var platform_name : String
    var user_agent : String
    var token_id : String
    init() {
        self.device        = ""
        self.uuid          = ""
        self.platform_name = ""
        self.user_agent    = ""
        self.token_id      = ""
    }
    enum CodingKeys : String, CodingKey {
         case device        = "device"
         case uuid          = "uuid"
         case platform_name = "platform_name"
         case user_agent    = "user_agent"
         case token_id      = "token_id"
    }
}
 
struct SrResponseHeader : Codable {
    var stat : String
    var msgObjs : [SrErrorMsgObject]?
    init() {
        self.stat = ""
    }
    enum CodingKeys : String, CodingKey {
         case stat    = "stat"
         case msgObjs = "msgObjs"
    }
}

public struct SrErrorMsgObject : Codable {
    var type : String
    var code : String
    var msg  : String
    init() {
        self.type = ""
        self.code = ""
        self.msg  = ""
    }
    enum CodingKeys : String, CodingKey {
         case type = "type"
         case code = "code"
         case msg  = "msg"
    }
}

struct SrCommonRequest <T:Codable> : Codable {
    var header : SrRequestHeader
    var data   : T?
    init() {
        self.header = SrRequestHeader()
    }
    enum CodingKeys : String, CodingKey {
         case header = "header"
         case data   = "data"
    }
}

struct SrCommonResponse <T:Codable> : Codable {
    var header : SrResponseHeader
    var data   : T?
    init() {
        self.header = SrResponseHeader()
    }
    enum CodingKeys : String, CodingKey {
         case header = "header"
         case data   = "data"
    }
}
