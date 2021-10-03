// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.
//

import SwiftUI

/// 讲解手势视频的时候，再试验
//// 这里是 一个示例，手势动作将在其他部分视频展示。
//struct ImagePager: View {
//
//    var imageNames: [String] = ["logo","logo","logo","logo","logo","logo"]
//
//    private var initPadding = (UIScreen.main.bounds.width - 300)/2
//
//    private let spacing: CGFloat = 50.0
//    
//    @State private var firstOffSet: CGFloat = 0.0
//
//    @State private var index: Int = 0
//    @State private var offset: CGFloat = 0.0
//    @State private var movingOffset: CGFloat = 0.0
//    @State private var endOffset: CGFloat = 0.0
//
//    init() {
//        self.offset = initPadding
//    }
//
//    var body: some View {
//        GeometryReader { geometry in // 1.使用GeometryReader来获取offset(scroll位置)
//            ScrollView(.horizontal, showsIndicators: true) {
//                HStack(spacing: self.spacing) {
//                    ForEach(0..<self.imageNames.count) {
//                        Image(self.imageNames[$0])
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: geometry.size.height, height: geometry.size.height) // 正方形的图标。
//                    }
//                }
//            }
////            .content.offset(x: self.offset) // 2. 使用 self.offset设置scrollViewのoffset
//            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
//
//            .gesture(DragGesture()
//                .onChanged({ value in  // 3. 监视Drag动作，获取offset。
//                    self.movingOffset = value.translation.width
//                    print("movingOffset : \(self.movingOffset)")
//                    print("")
//                    // self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
////                    self.offset = value.translation.width
//                })
//                .onEnded({ value in // 4. 当Drag动作完成后， 根据Drag位置、更新index
//                    print("on end")
//                    self.endOffset = value.predictedEndTranslation.width
//                    print("endOffset : \(self.endOffset)")
//                    print("")
//
////                    let scrollThreshold = geometry.size.width / 2
////                    if value.predictedEndTranslation.width < -scrollThreshold {
////                        self.index = min(self.index + 1, self.imageNames.endIndex - 1)
////                    } else if value.predictedEndTranslation.width > scrollThreshold {
////                        self.index = max(self.index - 1, 0)
////                    }
////                    withAnimation { // 5.设置offset
////                        self.offset = -geometry.size.width * CGFloat(self.index)
////                    }
//                })
//            )
//            .onAppear(perform: {
//                self.firstOffSet = (geometry.size.width - geometry.size.height)/2
//                self.offset = self.offset + self.firstOffSet
//            })
//
//
//        }.frame(width: UIScreen.main.bounds.width, height: 300)
//        .background(Color.gray)
//    }
//}
