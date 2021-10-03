// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

// 12-5
import SwiftUI

struct Sample1_3_2View: View {
    @State private var selected: Bool = false

    var body: some View {
       VStack {
          HStack(alignment: .top) {
             Image("book1")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 100)
                .border(selected ? Color.yellow : Color.clear, width: 2)

             VStack(alignment: .leading, spacing: 2) {
                Text("Steve Jobs").bold()
                Text("Walter Isaacson")
                Text("2011").font(.caption)
                Spacer()
             }.padding(.top, 5)
          }
          .frame(maxWidth: .infinity, maxHeight: 110)
          .border(Color.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
          .contentShape(Rectangle())
          .onTapGesture {
             self.selected.toggle()
          }
          Spacer()
       }
    }
}

struct Sample1_3_2View_Previews: PreviewProvider {
    static var previews: some View {
        Sample1_3_2View()
    }
}
