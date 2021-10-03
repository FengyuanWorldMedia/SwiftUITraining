// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
import Photos

public struct SrDemoImageView: View {
    
    var imageId: String?
    var showImage:Image
    
    init (showImage:Image) {
        self.showImage = showImage.resizable()
            .renderingMode(.original)
    }
    
    public var body: some View {
        self.showImage
            .frame(width: 50.0, height: 50.0)
    }
    
    public static func getNoneImage() -> SrDemoImageView {
        return SrDemoImageView(showImage:Image(systemName: "nosign")
            .resizable()
            .renderingMode(.original))
    }
    
    public static func getLoadingImage() -> SrDemoImageView {
        return SrDemoImageView(showImage:Image("onLoading")
            .resizable()
            .renderingMode(.original))
    }
    
    public static func getErrorImage() -> SrDemoImageView {
        return SrDemoImageView(showImage:Image(systemName:"xmark.octagon.fill")
                                .resizable()
                                .renderingMode(.original))
    }
    
}
