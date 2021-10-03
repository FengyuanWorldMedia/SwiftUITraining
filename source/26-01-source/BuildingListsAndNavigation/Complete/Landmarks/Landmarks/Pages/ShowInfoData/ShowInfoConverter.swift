// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

class ShowInfoConverter {
    
    public static func convert(_ from:[LandmarkMaster]) -> Void {
        
        AppVar.showInfo.landMarks.removeAll()
        for master in from {
            let showInfo = LandmarkMasterShowInfo(id: master.id, imageName: master.imageName, name: master.name)
            AppVar.showInfo.landMarks.append(showInfo)
        }
    }
    
    public static func convertDetail(_ from:Landmark) -> Void {
        
        let detailInfo = LandmarkDetailShowInfo()
        detailInfo.name                = from.name
        detailInfo.category            = from.category
        detailInfo.city                = from.city
        detailInfo.state               = from.state
        detailInfo.id                  = from.id
        detailInfo.park                = from.park
        detailInfo.longitude           = from.coordinates.longitude
        detailInfo.latitude            = from.coordinates.latitude
        detailInfo.imageName           = from.imageName
        detailInfo.likeCount           = from.likeCount
        AppVar.showInfo.landMarkDetail = detailInfo
    }
    
    
}
