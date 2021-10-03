// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct View13_08: View {
   @EnvironmentObject var appData2: AppData
   @State private var offsetContainer: CGSize = CGSize.zero
   @State private var selectedField: Int? = nil

   @State private var textInput: [String] = Array.init(repeating: "", count: 10)
   let listLabels = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9", "Item10"]

   var body: some View {
      ScrollView {
         VStack {
            Image("Landscape")
               .resizable()
               .scaledToFit()
            ForEach(0..<10, id: \.self) { index in
               HStack {
                  Text("\(self.listLabels[index]):")
                  TextField("Insert \(self.listLabels[index])", text: self.$textInput[index], onEditingChanged: { value in
                     self.selectedField = value ? index : nil
                  }).textFieldStyle(RoundedBorderTextFieldStyle())
               }
               .background(BackgroundView(offset: self.$offsetContainer, selected: self.$selectedField, index: index))
            }
            Spacer()
         }.padding()
         .offset(self.offsetContainer)
      }
      .animation(.linear)
      .onReceive(self.appData2.closePublisher, perform: { value in
         self.offsetContainer.height = 0
      })
   }
}
struct BackgroundView: View {
   @EnvironmentObject var appData2: AppData
   @Binding var offset: CGSize
   @Binding var selected: Int?
   let index: Int

   var body: some View {
      GeometryReader { geometry in
         Color.clear
            .onReceive(self.appData2.openPublisher, perform: { keyboardHeight in
               if let selIndex = self.selected, selIndex == self.index {
                  let screenWidth = UIScreen.main.bounds.width
                  let screenHeight = UIScreen.main.bounds.height
                  // 除去键盘范围的画面范围
                  let visibleFrame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - keyboardHeight)
                  // 输入区域的范围
                  let textFrame = geometry.frame(in: .global)
                  if !visibleFrame.contains(textFrame) {
                     // 当输入区域没有出现在键盘上面的区域时
                     // let newOffset = visibleFrame.height - geometry.size.height - 20 - textFrame.origin.y
                      let newOffset = -1 * (textFrame.maxY - (screenHeight - keyboardHeight) + 10)
                     self.offset.height = newOffset
                  }
               }
            })
      }
   }
}
