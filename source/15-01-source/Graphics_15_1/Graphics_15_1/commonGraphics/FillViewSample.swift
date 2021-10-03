// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct FillViewSample: View {
    
//    var lineStyle = StrokeStyle.init(lineWidth: 5,lineCap: .square, lineJoin: .miter, miterLimit: 10, dash: [5,10,15,25] , dashPhase: 0)
    
    var lineStyle = StrokeStyle.init(lineWidth: 5, dash: [5,10,15,25] , dashPhase: 0)
    
    var body: some View {
        VStack(spacing: 15) {
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.red)
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.red, lineWidth: 10)
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.red, style: self.lineStyle)
                .frame(width: 200, height: 200)
            
             Rectangle()
                .strokeBorder(Color.green, lineWidth: 10)
                .frame(width: 100, height: 100)
            
             Rectangle()
                .strokeBorder(Color.green, style: self.lineStyle)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .stroke(style:
                            StrokeStyle(
                                lineWidth: 10,
                                dash: [20, 10, 5, 40]
                            ))
                .frame(width: 150, height: 150)
        }
    }
}

struct FillViewSample_Previews: PreviewProvider {
    static var previews: some View {
        FillViewSample()
    }
}
