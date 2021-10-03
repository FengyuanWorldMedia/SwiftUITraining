// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct View13_01: View {
    
    @EnvironmentObject var appData: AppData13_01
    @State private var total: Int = 0
    
    init(total: Int) {
        _total = State(initialValue: total)
    }
    
   var body: some View {
     VStack {
        NavigationLink("Add Book", destination: AddBook13_01())
        HStack {
           Text("Total Books:")
           Text("\(total)")
              .font(.largeTitle)
        }
        Spacer()
     }.padding()
     .navigationBarTitle("Books")
     .onReceive(appData.publisher, perform: { notification in
         if let value = notification.object as? Int {
            self.total = value
         }
      })
   }
}

struct View13_01_Previews: PreviewProvider {
    static var previews: some View {
        View13_01(total: 0)
    }
}
