// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct GeometryReaderSample5: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    GeometryRectangle(color: Color.pink)
                    GeometryRectangle(color: Color.red)
                    GeometryRectangle(color: Color.blue)
                    GeometryRectangle(color: Color.pink)
                    GeometryRectangle(color: Color.red)
                    GeometryRectangle(color: Color.blue)
                    GeometryRectangle(color: Color.pink)
                    GeometryRectangle(color: Color.red)
                    GeometryRectangle(color: Color.blue)
                }
            }.border(Color.green, width: 1)
            Spacer()
        }.navigationBarTitle("GeometryReaderSample5", displayMode: .inline)
        // .offset(x: 0, y: 0)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct GeometryReaderSample5_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderSample5()
    }
}
