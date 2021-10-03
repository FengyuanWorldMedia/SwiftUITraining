// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

/// 自定义组件。
struct CustomViewContainer<Content: View>: View {
    
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ScrollView(.horizontal) {
            HStack(content: content)
        }.navigationTitle("sample")
    }
}

struct CustomViewContainerSampleTest : View{
    var body: some View {
        CustomViewContainer {
            ForEach(0..<30) { index in
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }.border(Color.red, width: 2)
    }
}

