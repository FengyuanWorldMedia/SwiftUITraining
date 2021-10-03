// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
import MapKit
struct LandmarkDetail: View {
    
    @EnvironmentObject var showInfo : ShowInfoEnvObj
    
    var body: some View {
        VStack {
            MapView(coordinate: CLLocationCoordinate2D(latitude: showInfo.landMarkDetail.latitude, longitude: showInfo.landMarkDetail.longitude))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            SrImageView(imageId: showInfo.landMarkDetail.imageName, imgHeight: 260, imgWidth: 260)
                .clipShape(Circle())
//                .frame(width: 260, height: 260)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(showInfo.landMarkDetail.name)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(showInfo.landMarkDetail.park)
                        .font(.subheadline)
                    Spacer()
                    Text(showInfo.landMarkDetail.state)
                        .font(.subheadline)
                }
                if let likeCount = showInfo.landMarkDetail.likeCount {
                    HStack(alignment: .center) {
                        ForEach(0..<likeCount/100) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color.yellow)
                                .frame(width: 25, height: 25)
                        }
                        ForEach(0..<5 - likeCount/100) { _ in
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.gray)
                        }
                        Text("(\(likeCount) Like)")
                            .font(.subheadline)
                        
                    }
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(showInfo.landMarkDetail.name), displayMode: .inline)
    }
}

//struct LandmarkDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LandmarkDetail(landmark: landmarkData[0])
//    }
//}
