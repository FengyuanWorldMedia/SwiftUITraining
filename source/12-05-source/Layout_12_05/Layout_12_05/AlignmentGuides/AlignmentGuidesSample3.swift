// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct AlignmentGuidesSample3: View {
    var body: some View {
        HStack(spacing: 10) {
            
            Image("car")
                .resizable()
                .frame(width: 120, height: 240)
            
            Image("airplane")
                .resizable()
                .frame(width: 120, height: 120)
                .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                    return dimension[VerticalAlignment.center] - 30
                })
            
            Image("train")
                .resizable()
                .frame(width: 120, height: 120)
                .alignmentGuide(VerticalAlignment.center, computeValue: { dimension in
                    return dimension[VerticalAlignment.center] - 50
                })
            
        }.border(Color.green, width: 1)
    }
}

struct AlignmentGuidesSample3_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuidesSample3()
    }
}
