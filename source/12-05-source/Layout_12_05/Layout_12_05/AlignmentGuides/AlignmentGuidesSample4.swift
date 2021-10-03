// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

extension VerticalAlignment {
    
    enum BusAlignment : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center] + 60
        }
    }
    static let busAlignment = VerticalAlignment(BusAlignment.self)
    
}


struct AlignmentGuidesSample4: View {
    var body: some View {
        HStack( alignment: .busAlignment , spacing: 10) { //,
            
            Image("car")
                .resizable()
                .frame(width: 120, height: 240)
            
            Image("airplane")
                .resizable()
                .frame(width: 120, height: 120)
                .alignmentGuide(VerticalAlignment.busAlignment, computeValue: { dimension in
                    return dimension[VerticalAlignment.center] + 120
                })
            
            Image("train")
                .resizable()
                .frame(width: 120, height: 120)
                .alignmentGuide(VerticalAlignment.busAlignment, computeValue: { dimension in
                    return dimension[VerticalAlignment.center]
                })
            
        }.border(Color.green, width: 1)
        .frame(width: 380, height: 400)
    }
}

struct AlignmentGuidesSample4_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuidesSample4()
    }
}
