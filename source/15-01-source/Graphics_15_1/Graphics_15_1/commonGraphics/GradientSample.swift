// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct GradientSample: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Hello World")
                .padding()
                .foregroundColor(.white)
                .font(.largeTitle)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .red, .black]),
                                   startPoint: .top, endPoint: .bottom)
                )
            Text("Hello World")
                .padding()
                .foregroundColor(.white)
                .font(.largeTitle)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .bottom, startRadius: 10, endRadius: 100)
                )
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .bottom, startRadius: 50, endRadius: 200)
                )
                .frame(width: 200, height: 200)
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 50, endRadius: 70)
                )
                .frame(width: 200, height: 200) 
        }

    }
}

struct GradientSample_Previews: PreviewProvider {
    static var previews: some View {
        GradientSample()
    }
}
