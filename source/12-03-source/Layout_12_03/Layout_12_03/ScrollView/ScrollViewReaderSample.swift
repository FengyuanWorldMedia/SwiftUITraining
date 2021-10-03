// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct BoyView:View {
    var id:Int
    private var name:String
    init(index: Int) {
        id = index
        self.name = "boy (\(id))"
    }
    var body: some View {
        HStack {
            Image("boy")
                .resizable()
                .frame(width: 50, height: 50)
            VStack {
                Text("my name is "+name)
                Text("丰源传媒学员")
            }
            Spacer()
        }
    }
}
// ScrollViewReader的使用。
struct ScrollViewReaderSample: View {

    @State private var position = 0
    var body: some View {
        ZStack {
            ScrollView {
                ScrollViewReader { proxy in
                    LazyVStack {
                        ForEach(0...200, id: \.self) { index in
//                            Text("You are good. \(index)")
                            BoyView(index: index)
                        }
                    }
                    .onChange(of: position) { value in
                        withAnimation {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                }
            }
            HStack() {
                Spacer()
                VStack(alignment: .trailing, spacing:10) {
                    Button("Top") { position = 0 }
                    Button("A") { position = 50 }
                    Button("B") { position = 100 }
                    Button("C") { position = 125 }
                    Button("D") { position = 175 }
                    Button("Bottom") { position = 200 }
                }
                Spacer().frame(width: 10.0)
                
            }
        }
    }
}

struct ScrollViewReaderSample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderSample()
    }
}
