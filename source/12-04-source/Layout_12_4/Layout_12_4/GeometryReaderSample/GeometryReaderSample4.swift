// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct GeometryReaderSample4: View {
    var body: some View {
        VStack {
            Text("Global坐标")
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 10) {
                    Text("Global坐标")
                    HStack {
                        Text("minX: \(Int(geometry.frame(in: .global).minX))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .global).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .global).maxX))")
                    }
                    HStack {
                        Text("minY: \(Int(geometry.frame(in: .global).minY))")
                        Spacer()
                        Text("midY: \(Int(geometry.frame(in: .global).midY))")
                        Spacer()
                        Text("maxY: \(Int(geometry.frame(in: .global).maxY))")
                    }
                    Text("Local坐标")
                    HStack {
                        Text("minX: \(Int(geometry.frame(in: .local).minX))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .local).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .local).maxX))")
                    }
                    HStack {
                        Text("minY: \(Int(geometry.frame(in: .local).minY))")
                        Spacer()
                        Text("midY: \(Int(geometry.frame(in: .local).midY))")
                        Spacer()
                        Text("maxY: \(Int(geometry.frame(in: .local).maxY))")
                    }
                    HStack {
                        Text("width: \(Int(geometry.size.width))")
                        Text("height: \(Int(geometry.size.height))")
                    }
                }.border(Color.green, width: 1)
                Spacer()
            }
            .padding(10) // View增加空白的边框
            .background(Color.pink)
            .foregroundColor(Color.white)
            Spacer()
        }
    }
}

struct GeometryReaderSample4_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderSample4()
    }
}
