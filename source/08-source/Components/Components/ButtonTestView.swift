// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ButtonTestView: View {
    var body: some View {
        Button(action: {
                        
        }, label: {
            Image(systemName: "clock")
            Text("Click Me")
            Text("Subtitle")
        })
        .foregroundColor(Color.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(5)
    }
}

struct ButtonTestView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTestView()
    }
}
