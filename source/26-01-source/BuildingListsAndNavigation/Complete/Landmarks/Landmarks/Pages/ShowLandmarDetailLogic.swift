// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ShowLandmarDetailLogic {
    var id: Int
    var isMock = UserDefaults.standard.bool(forKey: "enable_mock")
    var successHandler:(_ landmarkDetail: Landmark) -> Void
    var errorHandler:(_ errorType:String, _ errorCode:String,_ errorMsg:String) -> Void

    init(id: Int, successHandler:@escaping (_ landmarkDetail: Landmark) -> Void, errorHandler:@escaping(_ errorType:String, _ errorCode:String,_ errorMsg:String) -> Void) {
        self.id = id
        self.successHandler = successHandler
        self.errorHandler = errorHandler
    }
    
    public func execute() {
        if self.isMock {
            self.getDetailFromHttp()
        } else {
            self.getDetailFromLocal()
        }
    }
    
    private func getDetailFromLocal() {
        let landmarkLocalDataList:[Landmark] = AppVar.landmarkData.filter({
            $0.id == self.id
        })
        if landmarkLocalDataList.count > 0 {
            let detail = Landmark(name: landmarkLocalDataList[0].name,
                                  category: landmarkLocalDataList[0].category,
                                  city: landmarkLocalDataList[0].city,
                                  state: landmarkLocalDataList[0].state,
                                  id: landmarkLocalDataList[0].id,
                                  park: landmarkLocalDataList[0].park,
                                  coordinates: landmarkLocalDataList[0].coordinates,
                                  imageName: landmarkLocalDataList[0].imageName,likeCount: landmarkLocalDataList[0].likeCount)
            self.successHandler(detail)
        } else {
            self.errorHandler("bizError","00001","landmark detail info not found!")
        }
    }
    
    private func getDetailFromHttp() {
        let req = LandmarkDetailReq()
        SrWebApi.doPost(webApi: .getlandmarkdetail, parameter: req, resType: LandmarkDetailRes.self, successHandler: { res in
            if let res = res {
                let coor = Coordinates(longitude: res.coordinates.longitude, latitude: res.coordinates.latitude)
                
                let detail = Landmark(name: res.name,
                                      category: res.category,
                                      city: res.city,
                                      state: res.state,
                                      id: res.id,
                                      park: res.park,
                                      coordinates: coor,
                                      imageName: res.imageName,likeCount: res.likeCount ?? 0)
                self.successHandler(detail)
            } else {
                self.errorHandler("bizError","00001","landmark detail info not found!")
            }
        }, errorHandler: { errorObjList in
            if let errorObjList = errorObjList, errorObjList.count > 0 {
                self.errorHandler(errorObjList[0].type, errorObjList[0].code, errorObjList[0].msg)
            } else {
                self.errorHandler("unknow http error","unknow http error","unknow http error")
            }
        })
    }
}
