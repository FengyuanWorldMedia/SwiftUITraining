// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Path1Sample: View {
    var body: some View {
        VStack {
            Path { path in
                
                path.move(to: CGPoint(x: 100, y: 150))
                // 从点CGPoint(x: 100, y: 150) 开始 到CGPoint(x: 200, y: 150)
                path.addLine(to: CGPoint(x: 200, y: 150))
                // 从点CGPoint(x: 200, y: 150) 开始 到CGPoint(x: 100, y: 250)
                path.addLine(to: CGPoint(x: 100, y: 250))
                path.closeSubpath()
                
                path.move(to: CGPoint(x: 100, y: 260))
                path.addLine(to: CGPoint(x: 200, y: 160))
                path.addLine(to: CGPoint(x: 200, y: 260))
                path.closeSubpath()
                
                
                path.move(to: CGPoint(x: 300, y: 300))
                path.addLines([CGPoint(x: 300, y: 300),
                               CGPoint(x: 310, y: 320),
                               CGPoint(x: 330, y: 330),
                               CGPoint(x: 330, y: 340)])
                path.closeSubpath()
                
                
            }.stroke(Color.blue , lineWidth: 2)
        }
        
        
    }
}

struct Path1Sample_Previews: PreviewProvider {
    static var previews: some View {
        Path1Sample()
    }
}
