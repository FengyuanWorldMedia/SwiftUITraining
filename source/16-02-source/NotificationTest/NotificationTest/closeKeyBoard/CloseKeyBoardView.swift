// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct CloseKeyBoardView: View {
   
  @State private var textInput: String = ""
    
   var body: some View {
      VStack {
        Text("输入框获取焦点，弹起输入面板；失去焦点，输入面板消失。")
         TextField("Insert Caption", text: self.$textInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
         Spacer()
      }.padding()
      .background(Color.white
         .onTapGesture {
            self.dismissKeyboard()
         }
      )
   }
   func dismissKeyboard() {
      let windows = UIApplication.shared.windows
      let keyWindows = windows.filter({ $0.isKeyWindow })
      if !keyWindows.isEmpty {
         let window = keyWindows.first
         window?.endEditing(true)
      }
   }
}

struct CloseKeyBoardViewPreviews: PreviewProvider {
    static var previews: some View {
        CloseKeyBoardView()
    }
}
