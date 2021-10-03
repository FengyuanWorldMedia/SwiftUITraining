// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct BindingUITest: View {
    @State private var msg = "This is an default message."
    @State private var changeColorFlg = false
    
    var body: some View {
        
        Header(title: self.$msg)
        
        Text(self.msg)
            .padding(10)
            .foregroundColor( self.changeColorFlg ? .green : .black )
        
//        TextField("更改字符串", text: self.$msg)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        /// 和上面是一个意思。
        TextField("更改字符串", text: self._msg.projectedValue)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        Button("Change msg Button", action: {
            self.msg = "\(self.msg)1"
        }).padding(10)
        Button("Change Color Button", action: {
            self.changeColorFlg = !self.changeColorFlg
        })
    }
}

struct Header : View {
    @Binding var title : String
    var counter = 0
    
    init(title : Binding<String>) {
        self._title = title
        let sentence = self.title
        counter = sentence.count
        print("Header init")
    }
    
    var body: some View {
        VStack {
            Text("Binding Data: \(self.title) Counter:\(self.counter)")
                .padding(10)
                .foregroundColor(.pink)
            
            Button("Change Binding Data", action: {
                self.title = "wrong data"
                
            })
        }
    }
}


//struct Header2 : View {
////    @Binding var title : String
//    var title: Binding<String>
//    var counter = 0
//
//    init(title : Binding<String>) {
//        self.title = title
//        let sentence = self.title.wrappedValue
//        counter = sentence.count
//        print("Header init")
//    }
//
//    var body: some View {
//        VStack {
//            Text("Binding Data: \(self.title.wrappedValue) Counter:\(self.counter)")
//                .padding(10)
//                .foregroundColor(.pink)
//
//            Button("Change Binding Data", action: {
//                self.title.wrappedValue = "wrong data"
//
//            })
//        }
//    }
//}

