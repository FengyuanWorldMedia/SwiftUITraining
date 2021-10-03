// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
import Photos

public enum LoadingAnimateTypeEnum {
    case flower
    case app
    case text
    case progress
}

public struct SrImageView: View {
    
    enum StatusType {
        case ok
        case loading
        case error
    }
    
    @State private var statusType: StatusType = .loading //.error
    @State var uiImage: UIImage? = nil
    var imageId: String? = nil
    
    var imageUrl: String? = nil
    var animateType: LoadingAnimateTypeEnum
    var errorImageName: String = "post_default_image2"
    var imgHeight : CGFloat = 0.0
    var imgWidth : CGFloat = 0.0
    
    public init(_ animateType: LoadingAnimateTypeEnum = .flower,
                uiImage: UIImage? = nil,
                imageId: String? = nil,
                imageUrl: String? = nil,
                errorImageName: String = "errorImageName",
                imgHeight : CGFloat = 50.0,
                imgWidth : CGFloat = 50.0
         ) {
        self.animateType = animateType
        self.uiImage = uiImage
        self.imageId = imageId
        self.imageUrl = imageUrl
        self.errorImageName = errorImageName
        self.imgWidth = imgWidth
        self.imgHeight = imgHeight
        
       // if self.uiImage != nil {
//            self.onAppearProcess()
//        }
        
        
    }
    
    public var body: some View {
        VStack {
            if statusType == .loading {
                animateView().frame(width: imgWidth, height: imgHeight )
            } else if statusType == .error {
                Image(errorImageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: imgWidth, height: imgHeight )
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.red)
            } else {
                Image(uiImage: uiImage!)
                .resizable()
                .renderingMode(.original)
                .frame(width: imgWidth, height: imgHeight )
                .aspectRatio(contentMode: .fill)
                    
            }
        }
        .onAppear(perform: {
            
             self.onAppearProcess()
        })
//        .onDisappear {
//            self.statusType = .loading
//        }
    }
    
    private func animateView() -> some View {
        VStack {
            if animateType == LoadingAnimateTypeEnum.flower {
                ActivityIndicator1View()
            } else if animateType == LoadingAnimateTypeEnum.app {
                ActivityIndicator2View()
            } else if animateType == LoadingAnimateTypeEnum.text {
                ActivityIndicator3View()
            } else if animateType == LoadingAnimateTypeEnum.progress {
                ActivityIndicator4View()
            }
        }
    }
    
    private func onAppearProcess() {
        
        print("xxxxxxxxx onAppearProcess")
        
        if uiImage == nil {
            if let imgId = self.imageId {
                // TODO:
                if let img = UIImage(named: "\(imgId).jpg") {
                    self.statusType = self.downloadFinishProcess(img) ? .ok : .error
                } else {
                    loadImageBaseImageId(imgId)
                }
            } else if let imgUrl = imageUrl {
                loadImageBaseImageUrl(imgUrl)
            }
        } else {
            if let imgId = self.imageId {
               // TODO:
               if let img = UIImage(named: "\(imgId).jpg") {
                   self.statusType = self.downloadFinishProcess(img) ? .ok : .error
               } else {
                   loadImageBaseImageId(imgId)
               }
            }
           // self.statusType = .ok
        }
    }
    
    private func loadImageBaseImageId(_ imgId: String) {
        statusType = .loading
        SrImageLoader.loadImage(file_id: imgId, successHandler: { img in

            self.statusType = self.downloadFinishProcess(img) ? .ok : .error
        }, processHandler: { pos in
            
        }, errorHandler: {
            self.statusType = .error
        })
    }
    
    private func loadImageBaseImageUrl(_ imgUrl: String) {

        SrImageLoader.loadImage(url: imgUrl, successHandler: { img in
            self.statusType = self.downloadFinishProcess(img) ? .ok : .error
        }, processHandler: { pos in
        }, errorHandler: {
            self.statusType = .error
        })
    }
    
    private func downloadFinishProcess(_ img: UIImage) -> Bool {
        uiImage = img
        self.statusType = .ok
        
        return true
    }
}
