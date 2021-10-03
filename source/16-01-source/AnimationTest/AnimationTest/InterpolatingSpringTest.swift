// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

import Foundation
struct InterpolatingSpringTest: View {
    
    @State private var angle: Double = 0

    var body: some View {
        Button("Press here") {
            angle += 45
        }
        .padding()
        .rotationEffect(.degrees(angle))
        .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.8, initialVelocity: 10), value: angle)
    }
}
