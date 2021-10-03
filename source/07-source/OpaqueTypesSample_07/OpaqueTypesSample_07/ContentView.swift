// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
import common

struct ContentView: View {
    // Domain Specific Language
    // 特定领域专属语言/语法
    var body: some View {
        VStack {
            Text("123")
            Text("456")
        }
    }
    
    /// testOpaqueType
    func testOpaqueType() {
        let smallTriangle = OTriangle(size: 3)
        print(smallTriangle.draw())
        print("======")
        let flippedTriangle = smallTriangle.reverseShape()
        print(flippedTriangle.draw())
        /// Cannot find 'OFlippedShape' in scope
        // var flippedTriangle2 = OFlippedShape(smallTriangle)
        print("======")
        let joinedTriangles = joinShapes(partOne: smallTriangle, partTwo: flippedTriangle)
        print(joinedTriangles.draw())
    }
    
    /// testContreteType
    func testContreteType() {
        // test code.
        let smallTriangle = Triangle(size: 3)
        print(smallTriangle.draw())
        // *
        // **
        // ***
        print("---------------")
        let flippedTriangle = FlippedShape(shape: smallTriangle)
        print(flippedTriangle.draw())
        // ***
        // **
        // *
        print("---------------")
        let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
        print(joinedTriangles.draw())
        // *
        // **
        // ***
        // ***
        // **
        // *
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
