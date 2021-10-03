// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ShowLandmarListLogic {

    var isMock = UserDefaults.standard.bool(forKey: "enable_mock")
    var successHandler:(_ landmarkList: [LandmarkMaster]) -> Void
    var errorHandler:(_ errorType:String, _ errorCode:String,_ errorMsg:String) -> Void

    init(successHandler:@escaping (_ landmarkList: [LandmarkMaster]) -> Void, errorHandler:@escaping(_ errorType:String, _ errorCode:String,_ errorMsg:String) -> Void) {
        self.successHandler = successHandler
        self.errorHandler = errorHandler
    }
    
    public func execute() {
        if self.isMock {
            self.getListFromHttp()
        } else {
            self.getListFromLocal()
        }
    }
    
    private func getListFromLocal() {
        if AppVar.landmarkMasterData.count > 0 {
            self.successHandler(AppVar.landmarkMasterData)
        } else {
            self.errorHandler("bizError","00001","landmark info not found!")
        }
    }
    
    private func getListFromHttp() {
        let req = LandmarkReq()
        SrWebApi.doPost(webApi: .getlandmarks, parameter: req, resType: LandmarkRes.self, successHandler: { res in
            var landMarks:[LandmarkMaster] = Array<LandmarkMaster>()
            if let res = res {
                for mark in res.marks {
                    let landMark:LandmarkMaster = LandmarkMaster(name: mark.name,
                                                                 id: mark.id,
                                                                 imageName: mark.imageName)
                    landMarks.append(landMark)
                }
                self.successHandler(landMarks)
            } else {
                self.errorHandler("bizError","00001","landmark info not found!")
            }
        }, errorHandler: { errorObjList in
            if let errorObjList = errorObjList, errorObjList.count > 0{
                self.errorHandler(errorObjList[0].type, errorObjList[0].code, errorObjList[0].msg)
            } else {
                self.errorHandler("unknow http error","unknow http error","unknow http error")
            }
        })
    }
    
}
