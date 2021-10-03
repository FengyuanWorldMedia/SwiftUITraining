// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct GeometryReaderSample2: View {
    var body: some View {
        VStack{
                GeometryReader { geometry in
                    VStack {
                        VStack {
                            Text("Screen Width: \(UIScreen.main.bounds.size.width) Height: \(UIScreen.main.bounds.size.height)")
                                .foregroundColor(.white)
                            
                            Text("Global X: \(geometry.frame(in: .global).origin.x) Y: \(geometry.frame(in: .global).origin.y) width: \(geometry.frame(in: .global).width) height: \(geometry.frame(in: .global).height)")
                                .foregroundColor(.white)
                            
                            Text("Local X: \(geometry.frame(in: .local).origin.x) Y: \(geometry.frame(in: .local).origin.y) width: \(geometry.frame(in: .local).width) height: \(geometry.frame(in: .local).height)")
                                .foregroundColor(.white)
                        }
                         .padding()
                        .frame(width: 340, height: 300)
                        .background(Color.pink)
                        .border(Color.black, width: 1)
                            
                        
                        Text("local2 X: \(geometry.frame(in: .local).origin.x) Y: \(geometry.frame(in: .local).origin.y) width: \(geometry.frame(in: .local).width) height: \(geometry.frame(in: .local).height)")
                            .font(.system(size: 10))
                            
                            .foregroundColor(.black)
                       // ?? Text("hello").frame(width: 50, height: 50).coordinateSpace(name: "Area2")
                    }.frame(width: 340, height: 350)
                    .border(Color.orange, width: 1)
                    
                    
                } // GeometryReader
               .frame(width: 350, height: 400)
                .border(Color.red, width: 1)
//                .offset(x: 20)
            
               // .coordinateSpace(name: "Area2")
                // .offset(x: 2, y: 100)
                Spacer()
           }
           .frame(width: 360, height: 420)
           //.offset(x: 30, y: 30)
           .border(Color.blue, width: 1)
           //.coordinateSpace(name: "Area2")
       }
}

struct GeometryReaderSample2_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderSample2()
    }
}
