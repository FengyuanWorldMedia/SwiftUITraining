// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

class ContentViewData :ObservableObject {
    @Published var counter: Int = 0
    let timePubliser = Timer.publish(every: 2,  on: .main, in: .common)
}

struct ContentView: View {
    @ObservedObject var contentData = ContentViewData()
    
    var body: some View {
        Text("Hello, world! \(self.contentData.counter)")
            .padding()
            .onReceive(contentData.timePubliser, perform: { value in
                self.contentData.counter += 1
                
                if self.contentData.counter > 20 {
                    self.contentData.timePubliser.connect().cancel()
                    print("stop")
                }
            })
            .onAppear {
                self.contentData.timePubliser.connect()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
