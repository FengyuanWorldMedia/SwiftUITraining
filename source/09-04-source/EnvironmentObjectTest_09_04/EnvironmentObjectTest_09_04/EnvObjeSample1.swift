// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct EnvObjeSample1: View {
    @EnvironmentObject var envObj1 : EnvObj1
    var body: some View {
        Text("hello , \(envObj1.name),\(envObj1.title)")
    }
}

struct EnvObjeSample1_Previews: PreviewProvider {
    static var previews: some View {
        EnvObjeSample1()
    }
}
