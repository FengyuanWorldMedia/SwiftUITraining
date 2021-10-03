// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import SwiftUI

class ShowInfoEnvObj : ObservableObject {
    
    @Published public var landMarks      = [] as [LandmarkMasterShowInfo]
    
    @Published public var landMarkDetail = LandmarkDetailShowInfo()
}
 
public class LandmarkMasterShowInfo : Identifiable, ObservableObject {
    
    public var name: String
    public var id: Int
    public var imageName: String
    @Published public var imageView: SrDemoImageView
    
    public init(id: Int, imageName: String, name: String) {
        self.name      = name
        self.id        = id
        self.imageName = imageName
        self.imageView = SrDemoImageView.getNoneImage()
    }
    
    public func refresh() -> Void {
        if let img = ImageStore.shared.image(name: self.imageName) {
            self.imageView = SrDemoImageView(showImage: img)
        } else {
            SrDemoImageLoader.loadImage(file_id: self.imageName, successHandler: { img in
                self.imageView = SrDemoImageView(showImage: img)
            }, processHandler: { pos in
                print("onLoading...\(pos * 100)%")
                self.imageView = SrDemoImageView.getLoadingImage()
            }, errorHandler: {
                self.imageView = SrDemoImageView.getErrorImage()
            })
        }
    }
}

public class LandmarkDetailShowInfo : Identifiable {
    
    public var name : String
    public var category : String
    public var city : String
    public var state : String
    public var id : Int
    public var park : String
    public var longitude: Double
    public var latitude: Double
    public var imageName : String
    public var likeCount : Int?
    
    public init() {
        self.name          = ""
        self.category      = ""
        self.city          = ""
        self.state         = ""
        self.id            = 0
        self.park          = ""
        self.longitude     = 0
        self.latitude      = 0
        self.imageName     = ""
    }
}
