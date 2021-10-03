// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ListViewSample2: View {
    @State var editMode = true
    @State var checklistItems = [
        "SwiftUI-画面更新和Combine框架-02",
        "SwiftUI-画面更新和Combine框架-03",
        "SwiftUI-画面更新和Combine框架-04",
        "SwiftUI-画面更新和Combine框架-05"
     ]
    
    var body: some View {
        List {
            ForEach(checklistItems, id: \.self) { item in
                   Text(item)
            }.onDelete(perform: { indexSet in
                checklistItems.remove(at: indexSet.first!)
            })
        }
//        .listStyle(GroupedListStyle())
        .environment(\.editMode,
                     .constant(self.editMode ? EditMode.active : EditMode.inactive))
    }
}

struct ListViewSample2_Previews: PreviewProvider {
    static var previews: some View {
        ListViewSample2()
    }
}
