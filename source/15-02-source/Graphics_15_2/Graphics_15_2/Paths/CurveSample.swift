// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct CurveSample: View {
    var body: some View {
        VStack(spacing:15) {
            Path { path in
               path.move(to: CGPoint(x: 50, y: 50))
               path.addQuadCurve(to: CGPoint(x: 50, y: 200), control: CGPoint(x: 200, y: 25))
                
               path.move(to: CGPoint(x: 250, y: 50))
               path.addCurve(to: CGPoint(x: 250, y: 200), control1: CGPoint(x: 200, y: 125), control2: CGPoint(x: 300, y: 25))
                
            }.stroke(Color.blue, lineWidth: 5)
        }
    }
}

struct CurveSample_Previews: PreviewProvider {
    static var previews: some View {
        CurveSample()
    }
}
