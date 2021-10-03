// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

/// preference， onPreferenceChange 以及 coordinateSpace 的使用。
struct PreferenceSampleView: View {
//    @State private var offset = CGFloat.zero
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(0..<25) { i in
                        Text("Item \(i)")
                            .padding(10)
                            .border(Color.green, width: 1)
                    }
                }.background(
                    GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                                               value: -$0.frame(in: .named("scroll")).origin.y)
                    }
                )
                .onPreferenceChange(ViewOffsetKey.self) {
                    print("offset >> \($0)")
                }
            }.coordinateSpace(name: "scroll")
        }
    }
}
 

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
