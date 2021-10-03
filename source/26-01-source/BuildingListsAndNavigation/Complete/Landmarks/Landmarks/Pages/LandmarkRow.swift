// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct LandmarkRow: View {
    
    @EnvironmentObject var topScreenInfo: TopScreenInfo
    
    @ObservedObject var landmark: LandmarkMasterShowInfo
    
    @EnvironmentObject var homeAlert: HomeAlertInfo
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10)
            landmark.imageView
            self.printImageName(fileId: landmark.imageName)
            Text(landmark.name)
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(.gray)
            Spacer().frame(width: 15)
        }.onTapGesture {
            self.gotoDetail()
        }
        
    }
    
    func printImageName(fileId : String) -> some View {
        print("getImage:\(fileId)")
        return EmptyView()
    }
    
    func gotoDetail() {
   //        ShowInfoConverter.convertDetail(self.landmark)
           ShowLandmarDetailLogic(id: self.landmark.id) { landmark in
               ShowInfoConverter.convertDetail(landmark)
               self.topScreenInfo.displayNaviView = AnyView(LandmarkDetail())
               self.topScreenInfo.isNaviShow = true
           } errorHandler: { (errorType, errorCode, errorMsg) in
               self.homeAlert.alertWindow = Alert(title: Text(errorCode), message: Text(errorMsg), dismissButton: Alert.Button.cancel(Text("OK")))
               self.homeAlert.isShow = true
           }.execute()
       }
}

//struct LandmarkRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LandmarkRow(landmark: AppVar.landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
