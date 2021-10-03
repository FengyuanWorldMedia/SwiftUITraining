// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct SpacerSample: View {
    var body: some View {
        HStack{
            Spacer()
            Image("logo")
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            Text("丰源天下传媒")
            Spacer()
        }.background(Color.blue)
        .border(Color.red, width: 1)
    }
}

struct SpacerSample_Previews: PreviewProvider {
    static var previews: some View {
        SpacerSample().frame(width: UIScreen.main.bounds.width)
    }
}
