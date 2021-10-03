// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

/////  讲解这段代码
//struct CustomViewContainer<Content: View>: View {
//    var content: () -> Content
//    var body: some View {
//          ScrollView(.horizontal) {
//              HStack(content: content).padding()
//          }
//      }
//}

/// 讲解这段代码
struct CustomViewContainer2<Content: View>: View {
    
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators:false) {
            HStack(content: content).padding()
        }
    }
}

/// 讲解这段代码
struct CustomViewContainer2Test : View{
    var body: some View {
        CustomViewContainer2 {
            Image("logo")
//                .frame(width: 50, height: 50)
                .padding(10)
            Image("logo")
//                .frame(width: 50, height: 50)
                .padding(10)
            Image("logo")
//                .frame(width: 50, height: 50)
                .padding(10)
            Image("logo")
//                .frame(width: 50, height: 50)
                .padding(10)
            
            Text("helloworld")
            
        }.border(Color.red, width: 2)
//        .frame(width: .infinity)
//        .offset(x: -50, y: 0)
    }
}



struct CustomViewContainer2Test_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewContainer2Test()
    }
}

//struct ScrollViewTest: View {
//    @State private var position = 0
//    var body: some View {
//        VStack {
//            HStack {
//                Button("Top") { position = 0 }
//                Button("Middle") { position = 500 }
//                Button("Bottom") { position = 1000 }
//            }
//            ScrollView {
//                ScrollViewReader { proxy in
//                    LazyVStack {
//                        ForEach(0...1000, id: \.self) { index in
//                            Text("Row \(index)")
//                        }
//                    }
//                    .onChange(of: position) { value in
//                        withAnimation {
//                            proxy.scrollTo(value, anchor: .center)
//                        }
//                        print(position)
//                    }
//                } // ScrollViewReader
//            }//ScrollView
//        }
//    }
//}


 
