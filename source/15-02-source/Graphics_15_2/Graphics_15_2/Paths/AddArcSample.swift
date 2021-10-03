// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct AddArcSample: View {
   
    var body: some View {
        VStack {
            Path { path in
                
                path.move(to: CGPoint(x: 100, y: 150))
             
                path.addArc(center: CGPoint(x: 100, y: 150),
                            radius: 100, // 半径
                            startAngle: .degrees(180), // 开始角度
                            endAngle: .degrees(90), // 终了角度
                            clockwise: false) // 是否是逆时针
                
                path.closeSubpath()
            }.fill(Color.red)
            .border(Color.red, width: 2)
        }
    }
}

struct AddArcSample_Previews: PreviewProvider {
    static var previews: some View {
        AddArcSample()
    }
}
