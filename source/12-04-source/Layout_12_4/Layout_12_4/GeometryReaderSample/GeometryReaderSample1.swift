// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

// 通过GeometryReader， 获取 父组件的大小
struct GeometryReaderSample1: View {
    var body: some View {
        VStack {
//            GeometryReader { geometry in
//                Text("geometry: \(geometry.size.debugDescription)")
//            }
//            .frame(width: 200, height: 200)
//            .border(Color.red, width: 1)
            GeometryReader { geo in
                VStack{
                    Text("geometry: \(geo.size.debugDescription)")
                    Text("frame: \(geo.frame(in: .global).debugDescription)")
                }
            }
            .frame(width: 200, height: 200)
            .border(Color.red, width: 1)
        }.border(Color.red, width: 1)
        .frame(width: 400, height: 300)
    }
}

struct GeometryReaderSample1_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderSample1()
    }
}

