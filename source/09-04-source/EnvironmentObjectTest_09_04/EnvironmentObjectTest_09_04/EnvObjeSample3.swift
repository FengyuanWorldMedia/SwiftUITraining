// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct EnvObjeSample3: View {
    @EnvironmentObject var envObj1 : EnvObj1
    @EnvironmentObject var envObj2 : EnvObj2
    @EnvironmentObject var envObj3 : EnvObj3
    var body: some View {
        VStack {
            Text("hello , \(envObj1.name),\(envObj1.title)").padding(10)
            Text("hello , \(envObj2.item1),\(envObj2.item2)").padding(10)
            Text("hello , \(envObj3.item31),\(envObj3.item32)").padding(10)
        }
         
    }
}

struct EnvObjeSample3_Previews: PreviewProvider {
    static var previews: some View {
        EnvObjeSample3()
    }
}
