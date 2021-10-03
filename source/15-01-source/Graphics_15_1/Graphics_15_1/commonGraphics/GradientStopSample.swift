// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct GradientStopSample: View {
    var gradient =  Gradient(colors: [Color.green, Color.blue])
    var gradient2 =  Gradient(stops: [
        Gradient.Stop(color: .white, location: 0.1),
        Gradient.Stop(color: .pink, location: 0.4),
    ])
    var body: some View {
        VStack(spacing: 15) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 200, height: 100)
                Text("丰源传媒按钮").foregroundColor(.white)
                    .bold()
                    .font(.title)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        LinearGradient(gradient: gradient2, startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 200, height: 100)
//                    .background(Color.gray)
                Text("丰源传媒按钮").foregroundColor(.white)
                    .bold()
                    .font(.title)
            }
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                
            Rectangle()
                .fill(
                    ImagePaint(image: Image("logo"), scale: 0.5)
                )
                .border(Color.red, width: 2)
                .frame(width: 200, height: 200)
            Rectangle()
                .fill(
                    // 特别注意，CGRect高度和宽度范围为 0-1，在scale 设值时有意义。
                    // The results are undefined if this rectangle selects areas outside the [0, 1] range in either axis.
                    ImagePaint(image: Image("logo"),
                               sourceRect: CGRect(x: 0, y: 0, width: 0.5, height:0.5),
                               scale: 0.5 )
                )
                .border(Color.red, width: 2)
                .frame(width: 200, height: 200)
        }
    }
}

struct GradientStopSample_Previews: PreviewProvider {
    static var previews: some View {
        GradientStopSample()
    }
}
