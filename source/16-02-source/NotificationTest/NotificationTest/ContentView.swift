// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData13_01
    @EnvironmentObject var appData2: AppData
    
    // @State var isView13_01Active = false
    // @State var isView13_08Active = false
    
    @State var linkView = AnyView(EmptyView())
    @State var isViewActive = false
    
    enum NaviPageEnum : String {
        typealias RawValue = String
        case OnReceiveSample = "View.onReceive 示例"
        case OffSetSample = "根据键盘调整OffSet"
        case KeyBoardSample = "打开和关闭输入键盘"
        case NotificationSample = "授权-Basic 显示给用户的通知-文本-声音"
        case NotificationGroupSample = "通知分组"
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                // liuqingshang 总结：当前（2019.8.22），如果NavigationView中 有两个NavigationLink，
                // 在深度超过2的情况下，@Environment(\.presentationMode) var presentation 的返回，会直接到NavigationView，
                // 而不是定义中的 深度层为1 的View。
                // 使用 一个NavigationLink 进行折中 实现。
                
                // NavigationLink("View13_01", destination: View13_01(total: self.appData.userData.count))
                // 对View13_08 的 @Environment(\.presentationMode) var presentation 有影响
                // NavigationLink("View13_08", destination: View13_08())
                
                Button(NaviPageEnum.OnReceiveSample.rawValue) {
                    self.navigationTo(dest: .OnReceiveSample)
                }
                Button(NaviPageEnum.OffSetSample.rawValue) {
                    self.navigationTo(dest: .OffSetSample)
                }
                Button(NaviPageEnum.KeyBoardSample.rawValue) {
                    self.navigationTo(dest: .KeyBoardSample)
                }
                Button(NaviPageEnum.NotificationSample.rawValue) {
                    self.navigationTo(dest: .NotificationSample)
                }
                Button(NaviPageEnum.NotificationGroupSample.rawValue) {
                    self.navigationTo(dest: .NotificationGroupSample)
                }
                NavigationLink(destination: self.linkView, isActive: $isViewActive, label: {
                   EmptyView()
                })
            }
        }
    }
     
    
    private func navigationTo(dest: NaviPageEnum) {
        switch dest {
        case .OnReceiveSample:
            self.linkView = AnyView(View13_01(total: self.appData.userData.count))
        case .OffSetSample:
            self.linkView = AnyView(View13_08())
        case .KeyBoardSample:
            self.linkView = AnyView(CloseKeyBoardView())
        case .NotificationSample:
            self.linkView = AnyView(View13_10())
        case .NotificationGroupSample:
            self.linkView = AnyView(View13_14())
        }
        self.isViewActive = true
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
