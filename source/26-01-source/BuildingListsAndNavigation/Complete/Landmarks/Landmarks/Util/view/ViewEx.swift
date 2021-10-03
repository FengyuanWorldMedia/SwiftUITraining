// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import SwiftUI

final class HomeAlertInfo: ObservableObject {
    @Published var isShow = false
    @Published var alertWindow : Alert = Alert(title: Text("default"))
}

final class TopScreenInfo: ObservableObject {
    
     @Published var isNaviShow = false
     @Published var displayNaviView:AnyView = AnyView(EmptyView())
    
//     @Published var isViewShow = false    // full dialog
//     @Published var displayView:AnyView = AnyView(EmptyView())
//
//     @Published var isShow = false        // half dialog
//     @Published var displayHalfView:AnyView = AnyView(EmptyView())
}
