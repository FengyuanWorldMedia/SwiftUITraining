// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct SafeAreaSample: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "cloud")
                    .font(.system(size: 80))
                
                VStack (alignment: .leading){
                    Text("City")
                        .foregroundColor(.gray)
                    Text("SuZhou")
                        .font(.title)
                }
                Spacer()
            }
            .border(Color.gray, width: 2)
            Spacer()
            HStack {
                Image(systemName: "cloud")
                    .font(.system(size: 80))
                
                VStack (alignment: .leading){
                    Text("City")
                        .foregroundColor(.gray)
                    Text("WuXi")
                        .font(.title)
                }
                Spacer()
            }
            .border(Color.gray, width: 2)
          
        }
    }
}

struct SafeAreaSample_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaSample()
    }
}
