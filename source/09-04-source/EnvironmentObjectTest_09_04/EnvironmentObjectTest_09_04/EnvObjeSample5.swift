// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct EnvObjeSample5: View {
    @Environment(\.myCustomValue) var envObj2 : EnvObj2
 
    var body: some View {
        VStack {
            Text("EnvObjeSample5 hello , \(envObj2.item1),\(envObj2.item2)").padding(10)
        }
    }
}

 
