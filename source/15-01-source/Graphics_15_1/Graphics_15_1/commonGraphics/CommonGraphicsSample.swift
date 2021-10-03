// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct CommonGraphicsSample: View {
    var body: some View {
        VStack(spacing: 10) {
            
            Rectangle()
                .frame(width: 100, height: 100)
            // cornerRadius: 设置圆角半径
            
            ZStack {
                RoundedRectangle(cornerRadius: 50, style: .circular)
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
                     
//                RoundedRectangle(cornerRadius: 50, style: .circular)
//                    .opacity(0.5)
//                    .frame(width: 150, height: 150)
            }
            
            Circle()
                .frame(width: 100, height: 100)
             
            Ellipse()
                .frame(width: 100, height: 50)
            
            Capsule()
                .frame(width: 100, height: 50)
            
            Text("丰源传媒SwiftUI")
                        .padding()
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous).stroke(Color.black, lineWidth: 2))
        }
    }
}

struct CommonGraphicsSample_Previews: PreviewProvider {
    static var previews: some View {
        CommonGraphicsSample()
    }
}
