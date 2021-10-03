// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct AngularGradientSample: View {
    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                ).frame(width: 200, height: 200)
            Circle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center,
                                    startAngle:  .degrees(90),
                                    endAngle: .degrees(270)
                    )
                ).frame(width: 200, height: 200)
            
            Circle()
                .strokeBorder(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]),
                        center: .center,
                        startAngle: .zero,
                        endAngle: .degrees(360)), lineWidth: 40
                ).frame(width: 200, height: 200)
            
        }
    }
}

struct AngularGradientSample_Previews: PreviewProvider {
    static var previews: some View {
        AngularGradientSample()
    }
}
