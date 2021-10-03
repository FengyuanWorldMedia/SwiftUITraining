// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct AddEllipseSample: View {
    var body: some View {
        Path { path in
                  path.addEllipse(in: CGRect(x:10, y: 0, width: 200, height: 100))
            }
          .fill(Color.yellow)
          .frame(width: 200, height: 200)
        .border(Color.red, width: 1)
    }
}

struct AddEllipseSample_Previews: PreviewProvider {
    static var previews: some View {
        AddEllipseSample()
    }
}
