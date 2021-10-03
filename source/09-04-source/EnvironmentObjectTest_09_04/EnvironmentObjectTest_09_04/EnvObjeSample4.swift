// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct MyEnvironmentKey: EnvironmentKey {
    typealias Value = EnvObj2
    static var defaultValue: EnvObj2 = EnvObj2()
}

extension EnvironmentValues {
    var myCustomValue: EnvObj2 {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}


struct EnvObjeSample4: View {
    
    @Environment(\.myCustomValue) var envObj2 : EnvObj2
    
    var body: some View {
        VStack {
            Text("hello , \(envObj2.item1),\(envObj2.item2)").padding(10)
            EnvObjeSample5()
            NavigationLink(destination: EnvObjeSample5(), label: {
                Text("Environment object EnvObjeSample5!")
            }).padding(10)
        }
         
    }
}

struct EnvObjeSample4_Previews: PreviewProvider {
    static var previews: some View {
        EnvObjeSample4()
    }
}
