// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct StateTestUI: View {
    
    @State private var msg = "This is an default message."
    @State private var changeColorFlg = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text(self.msg)
                .foregroundColor( self.changeColorFlg ? .green : .black )
            
            Button("Change msg Button", action: {
                self.msg = "\(self.msg)1"
            })
            
            Button("Change Color Button", action: {
                self.changeColorFlg = !self.changeColorFlg
            })
        }
    }
}

struct StateTestUI_Previews: PreviewProvider {
    static var previews: some View {
        StateTestUI()
    }
}
