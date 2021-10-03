// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

class AppVar {
    
    public static var homeAlertInfo: HomeAlertInfo = HomeAlertInfo()
    public static var topScreenInfo: TopScreenInfo = TopScreenInfo()
    
    public static let landmarkMasterData: [LandmarkMaster] = load("landmarkMasterData.json")
    public static let landmarkData: [Landmark] = load("landmarkData.json")
    
    public static let showInfo = ShowInfoEnvObj()
    
}
