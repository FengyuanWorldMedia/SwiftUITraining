// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
struct BookInfo :Identifiable {
    var id = UUID()
    var title : String
    var desc : String
}

struct ForeachSample: View {
    let listOfBooks: [String] = ["人在北京", "梦境", "他乡"]
    @State var listOfBookInfo : [BookInfo] = [BookInfo(title: "title:1",  desc: "desc:1"),
                                              BookInfo(title: "title:2",  desc: "desc:2"),
                                              BookInfo(title: "title:3",  desc: "desc:3"),
                                              BookInfo(title: "title:4",  desc: "desc:4"),
    ]
    init() {
    }
    
    var body: some View {
        VStack {
           ForEach(1...10, id: \.self) { value in
              Text("亲爱的读者No: \(value)")
           }
           Spacer()
            
           VStack {
               ForEach(listOfBooks, id: \.self) { value in
                  VStack {
                     Text(value)
                     Divider()
                  }
               }
               Spacer()
           }.background(Color.gray)
            Spacer()
            
            VStack (alignment:.leading) {
                ForEach(listOfBookInfo) { value in
                   HStack {
                    Text(value.title)
                    Text(value.desc)
                   }
                    Divider()
                }
                // .moveDisabled(true)
                .onDelete(perform: { indexSet in
                    listOfBookInfo.remove(at: indexSet.first!)
                })
                Spacer()
            }.background(Color.green)
            
            
        }
    }
}

struct ForeachSample_Previews: PreviewProvider {
    static var previews: some View {
        ForeachSample()
    }
}
