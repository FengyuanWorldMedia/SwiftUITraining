// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

public enum SrWebApiEnum: String {
    public typealias RawValue = String
    
    case getlandmarkdetail    = "bizcd01/getlandmarkdetail"
    case getlandmarks         = "bizcd01/getlandmarks"
  
    public var url: String {
        return SrBaseWebUrl.createWebApiUrl(webapi: self)
    }
}

