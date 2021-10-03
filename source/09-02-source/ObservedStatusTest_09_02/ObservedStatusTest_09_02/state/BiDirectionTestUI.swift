// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct BiDirectionTestUI: View {
    @State private var msg = "This is an default message."
    @State private var changeColorFlg = false
    
    var body: some View {
        Text(self.msg)
            .padding(10)
            .foregroundColor( self.changeColorFlg ? .green : .black )
        
        TextField("更改字符串", text: self._msg.projectedValue)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        Button("Change msg Button", action: {
            self.msg = "\(self.msg)1"
        }).padding(10)
        Button("Change Color Button", action: {
            self.changeColorFlg = !self.changeColorFlg
        })
    }
}

struct BiDirectionTestUI_Previews: PreviewProvider {
    static var previews: some View {
        BiDirectionTestUI()
    }
}
