// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

// 在模拟器中 不能动作
struct ListViewSample3: View {
    @State var editStyleMode = true
    @State var checklistItems = [
        "SwiftUI-画面更新和Combine框架-02",
        "SwiftUI-画面更新和Combine框架-03",
        "SwiftUI-画面更新和Combine框架-04",
        "SwiftUI-画面更新和Combine框架-05"
     ]
    
    var body: some View {
        VStack {
            List {
                ForEach(checklistItems, id: \.self) { item in
                       Text(item)
                }
                .onDelete(perform: { indexSet in
                    checklistItems.remove(at: indexSet.first!)
                })
                .onMove(perform: { indices, newOffset in
                    checklistItems.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .environment(\.editMode,
                         .constant(self.editStyleMode ? EditMode.active : EditMode.inactive))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            self.editStyleMode.toggle()
        }, label: {
            Text(self.editStyleMode ? "active":"inactive")
        }))
        Spacer()
    }
            
    }
}

struct ListViewSample3_Previews: PreviewProvider {
    static var previews: some View {
        ListViewSample3()
    }
}
