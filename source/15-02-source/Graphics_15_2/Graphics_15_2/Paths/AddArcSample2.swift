// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
// https://developer.apple.com/documentation/coregraphics/cgcontext/2427122-addarc
//func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat)
//Parameters
//tangent1End
//The end point, in user space coordinates, for the first tangent line to be used in constructing the arc. (The start point for this tangent line is the path's current point.)
//
//tangent2End
//The end point, in user space coordinates, for the second tangent line to be used in constructing the arc. (The start point for this tangent line is the tangent1End point.)
//
//radius
//The radius of the arc, in user space coordinates.

struct AddArcSample2: View {
    let radius: CGFloat = 60
    
    var body: some View {
        VStack {
            Path { path in
                
                 path.move(to: CGPoint(x: 100, y: 100))
             
                path.addArc(tangent1End: CGPoint(x: 200, y: 100),
                            tangent2End: CGPoint(x: 200, y: 200),
                            radius: 100)
                
              //  path.addLine(to: CGPoint(x: 400, y: 500))
                
//                path.closeSubpath()
            }.stroke(Color.blue , lineWidth: 2)
            .border(Color.red, width: 2)
            
            
            Rectangle()
               .fill(Color.black)
               .frame(width: 200, height: 200)
               .mask(
                   GeometryReader { geo in
                       Path { path in
                           let frame = geo.frame(in: .local)
                           path.move(to: CGPoint(x: frame.minX, y: frame.midY))
                           path.addArc(tangent1End: CGPoint(x: frame.minX, y: frame.minY),
                                       tangent2End: CGPoint(x: frame.midX, y: frame.minY),
                                       radius: self.radius)
                           path.addArc(tangent1End: CGPoint(x: frame.maxX, y: frame.minY),
                                       tangent2End: CGPoint(x: frame.maxX, y: frame.midY),
                                       radius: self.radius)
                           path.addArc(tangent1End: CGPoint(x: frame.maxX, y: frame.maxY),
                                       tangent2End: CGPoint(x: frame.midX, y: frame.maxY),
                                       radius: self.radius)
                           path.addArc(tangent1End: CGPoint(x: frame.minX, y: frame.maxY),
                                       tangent2End: CGPoint(x: frame.minX, y: frame.midY),
                                       radius: self.radius)
                       }
                   }
               )
        }

        
    
    }
}

struct AddArcSample2_Previews: PreviewProvider {
    static var previews: some View {
        AddArcSample2()
    }
}
