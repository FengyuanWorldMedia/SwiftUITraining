// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
import Alamofire

//class ImageViewRefreshModel : ObservableObject {
//    @Published var refreshFlg: Bool = true
//}

struct LandmarkList: View {
    
    @EnvironmentObject var topScreenInfo: TopScreenInfo
    
    @EnvironmentObject var  showInfo : ShowInfoEnvObj
    
    @EnvironmentObject var homeAlert: HomeAlertInfo
    
//    @ObservedObject var imageViewRefresh : ImageViewRefreshModel = ImageViewRefreshModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    if self.showInfo.landMarks.count > 0 {
                        VStack {
                            ForEach(self.showInfo.landMarks) { landmark in
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    } else {
                        Text("LandMark not loaded, please check network.")
                    }
                }.edgesIgnoringSafeArea(.horizontal)
                
                NavigationLink(destination:self.topScreenInfo.displayNaviView,
                               isActive:self.$topScreenInfo.isNaviShow) {
                    EmptyView()
                }
            }
            .navigationBarTitle(Text("Landmarks"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        print("Load data from server.")
                                        ShowLandmarListLogic() { showInfos in
                                            var landmarkList = [LandmarkMasterShowInfo]()
                                            for master in showInfos {
                                                let showInfo = LandmarkMasterShowInfo(id: master.id,
                                                                                      imageName: master.imageName,
                                                                                      name: master.name)
                                                landmarkList.append(showInfo)
                                            }
                                            AppVar.showInfo.landMarks = landmarkList
                                            for master in AppVar.showInfo.landMarks {
                                                master.refresh()
                                            }
                                             // ShowInfoConverter.convert(showInfos)
//                                            self.imageViewRefresh.refreshFlg.toggle()
//                                            self.imageViewRefresh.refreshFlg.toggle()
                                            // self.checkData()
                                        } errorHandler: { (errorType, errorCode, errorMsg) in
                                            self.homeAlert.alertWindow =  Alert(title: Text(errorCode), message: Text(errorMsg), dismissButton: Alert.Button.cancel(Text("OK")))
                                            self.homeAlert.isShow = true
                                            self.checkData()
                                        }.execute()
                                    }){
                                        Text("Reload")
                                    })
        }.alert(isPresented: self.$homeAlert.isShow, content: {
            self.homeAlert.alertWindow
        }).onAppear{
            self.checkData()
            for master in AppVar.showInfo.landMarks {
                master.refresh()
            }
        }
    }
    
    func checkData() -> Void {
        if self.showInfo.landMarks.count == 0 {
            self.homeAlert.alertWindow =  Alert(title: Text(""), message: Text("No data or abnormal network"), dismissButton: Alert.Button.cancel(Text("OK")))
            self.homeAlert.isShow = true
        }
    }
    
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
