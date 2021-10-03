// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct TextTestView: View {
    var body: some View {
        Text("Hello World")
            .foregroundColor(Color.red)
            .font(.system(size: 20.0))
            .fontWeight(.bold)
    }
}

struct TextTestView_Previews: PreviewProvider {
    static var previews: some View {
        TextTestView()
    }
}
