// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct AlignmentGuidesSample1: View {
    var body: some View {
        
        VStack (alignment: .trailing, spacing: 10) {  // 【Container Alignment】
            LabelView(labelStr: "Labelsdsdsdsd\nsdsdsdsrererererererererdsdsd", color: .blue)
                .multilineTextAlignment(.center) // 【multilineTextAlignment】
            LabelView(labelStr: "Label1", color: .blue)
            
        }
        .border(Color.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        
        .frame(width: UIScreen.main.bounds.width,
               height: 400, alignment: .leading) // 【Frame Alignment】
        .border(Color.green, width: 1)
    }
}

struct AlignmentGuidesSample1_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuidesSample1()
    }
}

struct LabelView: View {
    var labelStr : String
    var color : Color
    
    var body: some View {
        Text(self.labelStr)
            .background(self.color)
            .border(Color.green, width: 1)
    }
}
