// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

class EnvObj1: ObservableObject {
    @Published var title : String = "Defalut title"
    @Published var name : String = "name"
    
}
class EnvObj2: ObservableObject {
    @Published var item1 : String = "item21 value1"
    @Published var item2 : String = "item21 value2"
}
class EnvObj3: ObservableObject {
    @Published var item31 : String = "item31 value1"
    @Published var item32 : String = "item32 value2"
}
