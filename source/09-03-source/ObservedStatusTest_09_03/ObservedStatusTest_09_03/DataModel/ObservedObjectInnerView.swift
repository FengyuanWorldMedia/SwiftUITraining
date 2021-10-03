// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import SwiftUI
///dataModel 在子View中使用
struct ObservedObjectInnerView: View {
    
    @ObservedObject var dataModel :AppDataModel

    init(dataModel :AppDataModel) {
        self.dataModel = dataModel
    }
    
    var body: some View {
        
        ObservedObjectInnerViewHeader(dataModel: self.dataModel)
        
        Text(self.dataModel.msg)
            .padding(10)
            .foregroundColor( self.dataModel.changeColorFlg ? .green : .black )
        
        /// 和上面是一个意思。
        TextField("更改字符串", text: self.$dataModel.msg)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        Button("Change msg Button", action: {
            self.dataModel.msg = "\(self.dataModel.msg)1"
        }).padding(10)
        Button("Change Color Button", action: {
            self.dataModel.changeColorFlg = !self.dataModel.changeColorFlg
        })
    }
}


struct ObservedObjectInnerViewHeader : View {
    
    @ObservedObject var dataModel :AppDataModel
    var counter = 0
    
    init(dataModel :AppDataModel) {
        self.dataModel = dataModel
    }
    
    var body: some View {
        VStack {
            Text("ObservedObjectInnerViewHeader Data: \(self.dataModel.msg)")
                .padding(10)
                .foregroundColor(.pink)
            
            Button("ObservedObjectInnerViewHeader Change Binding Data", action: {
                self.dataModel.msg = "wrong data"
                
            })
        }
    }
}
