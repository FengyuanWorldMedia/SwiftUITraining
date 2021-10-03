// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct NavigationViewTest3: View {
    @State private var selection: String? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isShowingDetailView = false
    @State private var destinationView:AnyView = AnyView(EmptyView())
    var body: some View {
            VStack (spacing: 15) {
                NavigationLink("NavigationViewTest2", destination: NavigationViewTest2())
                
                // 点击就可以进到 指定View
                NavigationLink(destination: EmptyView()) {
                     Text("直接点击进入")
                }
                
                // 可以通过外部变量控制进到 指定 的View。
                // 注意点：变量isShowingDetailView在设置成true时，进行跳转。
                //       但是返回时，isShowingDetailView 不会变为false。
                NavigationLink(destination: Text("根据变量"),
                               isActive: $isShowingDetailView) {
                               EmptyView()
                }
                Button(action: {
                    self.isShowingDetailView = true
                }, label: {
                    Text("state change")
                })
                // NavigationLink比较多的时候，考虑使用 带有tag的 NavigationLink
                NavigationLink(destination: Text("第一个View"), tag: "First", selection: $selection) { EmptyView() }
                NavigationLink(destination: Text("第二个View"), tag: "Second", selection: $selection) { EmptyView() }
                NavigationLink(destination: self.destinationView, tag: "Second", selection: $selection) { EmptyView() }
                Button("按钮点击进入 第一个View") {
                    self.selection = "First"
                }
                Button("按钮点击进入 第二个View") {
                    self.selection = "Second"
                }
                Button("back") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                // 也可以把跳转 目标画面，设置为变量，这样也可以通过一个变量去控制跳转。
                // 例子省。
                // 参照: 其中 xxxxView 为目标画面对象。
                //  NavigationLink(destination: AnyView（xxxxView()),
                //  isActive: $showXxxxView) {
                //   EmptyView()
                //  }
                
            }
            .navigationTitle("Navigation")
            .navigationBarTitleDisplayMode(.automatic)
      }
}

struct NavigationViewTest3_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewTest3()
    }
}
