// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct AlignmentGuidesSample2: View {
    var body: some View {
        VStack (alignment: .trailing, spacing: 10) {
            LabelView(labelStr: "Labelsdsdsdsdererere12313212313rerererdsdsd12", color: .blue)
                .multilineTextAlignment(.center)
            LabelView(labelStr: "Labelsdsdsdsderererererererdsdsd12", color: .blue)
                .multilineTextAlignment(.center)
            LabelView(labelStr: "Label1", color: .blue)
                .alignmentGuide(HorizontalAlignment.trailing, computeValue: { dimension in

                    print("dimension.height: \(dimension.height)")
                    print("dimension.width: \(dimension.width)")
                    print("dimension center: \(dimension[HorizontalAlignment.trailing])")
                    return dimension[HorizontalAlignment.trailing] + 10
                })
//                .offset(x: 10)
        }
//        .frame(width: UIScreen.main.bounds.width, height: 400, alignment: .leading)
        .border(Color.green, width: 1)
    }
}

struct AlignmentGuidesSample2_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuidesSample2()
    }
}
