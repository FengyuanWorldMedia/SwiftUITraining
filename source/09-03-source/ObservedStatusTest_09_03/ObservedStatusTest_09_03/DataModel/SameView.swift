// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

import SwiftUI
///dataModel 只有一个View使用。
struct SameView: View {
    
    @ObservedObject var dataModel :AppDataModel

    init(dataModel :AppDataModel) {
        self.dataModel = dataModel
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(self.dataModel.msg)
                .foregroundColor( self.dataModel.changeColorFlg ? .green : .black )
            
    //        TextField("更改字符串", text: self.$msg)
    //            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            /// 和上面是一个意思。
            TextField("更改字符串", text: self.$dataModel.msg)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Change msg Button", action: {
                self.dataModel.msg = "\(self.dataModel.msg)1"
            })
            Button("Change Color Button", action: {
                self.dataModel.changeColorFlg = !self.dataModel.changeColorFlg
            })
        }
    }
}


//struct Header : View {
//    @Binding var title : String
//    var counter = 0
//
//    init(title : Binding<String>) {
//        self._title = title
//        let sentence = self._title.wrappedValue
//        counter = sentence.count
//        print("Header init")
//    }
//
//    var body: some View {
//        VStack {
//            Text("Binding Data: \(self.title) Counter:\(self.counter)")
//                .padding(10)
//                .foregroundColor(.pink)
//
//            Button("Change Binding Data", action: {
//                self._title.wrappedValue = "wrong data"
//
//            })
//        }
//    }
//}
