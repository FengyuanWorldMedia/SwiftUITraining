// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct LabelTestView: View {
    var body: some View {
        VStack {
            Label("Website", systemImage: "globe")
            Label("Swift", image: "swift")
        }
    }
}

struct LabelTestView_Previews: PreviewProvider {
    static var previews: some View {
        LabelTestView()
    }
}
