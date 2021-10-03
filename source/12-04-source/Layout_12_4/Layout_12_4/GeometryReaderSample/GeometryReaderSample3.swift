// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct GeometryReaderSample3: View {
    var body: some View {
          ScrollView {
              VStack {
                  Text("GeometryReader Get Global Origin")
                  GeometryRectangle(color: Color.pink)
                  GeometryRectangle(color: Color.red)
                  .offset(x: 10, y: 0)
                 
                 ZStack {
                      GeometryRectangle(color: Color.blue)
                          .offset(x: 30, y: 0)
                  }.offset(x: 10, y: 0)
                
                ZStack {
                    ZStack {
                         GeometryRectangle(color: Color.blue)
                             .offset(x: 30, y: 0)
                     }.offset(x: 10, y: 0)
                    .frame(width: 240, height: 90)
                }.offset(x: 5, y: 0)
                .frame(width: 250, height: 90)
                
                  GeometryReader { geometry in
                      Text("geometry: \(geometry.size.debugDescription)")
                      //print(geometry.)
                  }.frame(height: 30)
                  .border(Color.blue, width: 1)
                
              }
          }
      }
}

struct GeometryRectangle: View {
    
    @State var fontBold : Bool = false
    var color: Color
    var body: some View {
        GeometryReader { geometry in
            VStack {

                Button(action: {
                    // let image = self.takeScreenshot(origin: geometry.frame(in: .global).origin, size: geometry.size)
                    // print(image)
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(fontBold ? Color.black : color)
                    .overlay(
                        VStack {
                            Text("X: \(Int(geometry.frame(in: .global).origin.x)) Y: \(Int(geometry.frame(in: .global).origin.y)) width: \(Int(geometry.frame(in: .global).width)) height: \(Int(geometry.frame(in: .global).height))")
                                .foregroundColor(.white)
                            Text("size: \(geometry.size.debugDescription)")
                                .fontWeight(fontBold ? .heavy : .light)
                                .foregroundColor(fontBold ? .white : .gray)
                })}
            }.onChange(of: geometry.frame(in: .global).minY, perform: {
                value in
                if value >= 100 && value <= 200 {
                    fontBold = true
                } else {
                    fontBold = false
                }
            })

        }.frame(height: 100)
        
    }
}

struct GeometryReaderSample3_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderSample3()
    }
}
