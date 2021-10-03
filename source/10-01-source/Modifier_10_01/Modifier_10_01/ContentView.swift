// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct MyModifier : ViewModifier {
    var size : CGFloat
    
    init(size : CGFloat) {
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: self.size).weight(.semibold))
            .foregroundColor(Color.blue)
    }
}

struct ContentView: View {
    var body: some View {
        
        VStack{
            Text("欢迎，丰源传媒。")
                .padding(10)
                .font(.largeTitle)
            Image(systemName: "envelope.circle")
                .modifier(MyModifier(size: 50))
            Image(systemName: "envelope.circle")
                .modifier(MyModifier(size: 100))
        }
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
