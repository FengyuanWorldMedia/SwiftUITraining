// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import SwiftUI

class AppDataModel : ObservableObject {
//    @Published var title : String = "Default title"
//    @Published var name : String = "Default name"
    @Published var msg = "This is an default message."
    @Published var changeColorFlg = false
}
