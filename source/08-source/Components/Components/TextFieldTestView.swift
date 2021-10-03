// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct TextFieldTestView: View {
    @State var name: String = "My name"
    
    var body: some View {
        HStack {
            Text (self.name)
            TextField("Please Input", text: $name)
                .background(Color.green)
        }
    }
}

struct TextFieldTestView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTestView()
    }
}
