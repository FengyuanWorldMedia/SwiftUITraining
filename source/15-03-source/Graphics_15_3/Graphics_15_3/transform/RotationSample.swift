// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct RotationSample: View {
    var body: some View {
        VStack (spacing:100){
            Image("logo")
               .resizable()
               .scaledToFit()
               .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: 30))
               .border(Color.green, width: 1)
            HStack {
                Image("logo")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 80, height: 80)
                    .rotation3DEffect(
                        .degrees(30),
                        axis: (x: 1.0, y: 2.0, z: 1.0)
                    )
                   .border(Color.green, width: 1)
                Image("logo")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 80, height: 80)
                    .rotation3DEffect(
                        .degrees(30),
                        axis: (x: 1.0, y: 0.0, z: 0.0)
                    )
                   .border(Color.green, width: 1)
                Image("logo")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 80, height: 80)
                    .rotation3DEffect(
                        .degrees(30),
                        axis: (x: 0.0, y: 0.0, z: 1.0)
                    )
                   .border(Color.green, width: 1)
            }
            
            
            Image("logo")
               .resizable()
               .scaledToFit()
               .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: 30), anchor: .bottom)
               .border(Color.green, width: 1)
        }
        
   
     }
}

struct RotationSample_Previews: PreviewProvider {
    static var previews: some View {
        RotationSample()
    }
}
