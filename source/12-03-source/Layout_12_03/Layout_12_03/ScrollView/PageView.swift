// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
struct PageView: View {
    
    @State private var selection = 0 {
        didSet {
            print("current index :\(selection)")
        }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Button("next") {
                var curr = selection
                if curr == 9 {
                    curr = 0
                } else {
                    curr = selection + 1
                }
                withAnimation {
                    selection = curr
                }
            }
            TabView(selection: $selection) {
                ForEach(0..<10) { i in
                    ZStack {
                        Color.black
                        Text("Item: \(i)").foregroundColor(.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    .onTapGesture {
                        print("Item: \(i) clicked")
                    }
                }.padding(.all, 10)
            }
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .tabViewStyle(PageTabViewStyle())
        }
    }
}
