// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct EnvObjeSample2: View {
    @EnvironmentObject var envObj2 : EnvObj2
    var body: some View {
        Text("hello , \(envObj2.item1),\(envObj2.item2)")
    }
}

struct EnvObjeSample2_Previews: PreviewProvider {
    static var previews: some View {
        EnvObjeSample2()
    }
}
