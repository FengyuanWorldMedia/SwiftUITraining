// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct EnvObjeSample6: View {
    @Environment(\.colorScheme) var mode
    
    var body: some View {
        Text("Color scheme \(mode == .dark ? "dark" : "Light")")
            .background(mode == .dark ? Color.black : Color.white)
            .foregroundColor(mode == .dark ? Color.white : Color.black)
    }
}

struct EnvObjeSample6_Previews: PreviewProvider {
    static var previews: some View {
        EnvObjeSample6()
    }
}
