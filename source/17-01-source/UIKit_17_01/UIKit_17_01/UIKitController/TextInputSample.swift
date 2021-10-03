// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.
//

import SwiftUI
import UIKit
//
//struct TextView: UIViewRepresentable {
//   @Binding var input: String
//
//   func makeUIView(context: Context) -> UITextView {
//      let view = UITextView()
//      view.backgroundColor = UIColor.yellow
//      view.font = UIFont.systemFont(ofSize: 17)
//      view.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//      return view
//   }
//    // 当Swift UI状态【 @Binding var input: String】 发生改变时 被调用。
//   func updateUIView(_ uiView: UITextView, context: Context) {
//      uiView.text = self.input
//   }
//}

struct TextView2: UIViewRepresentable {
    @Binding var input: String
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.backgroundColor = UIColor.yellow
        view.font = UIFont.systemFont(ofSize: 17)
        view.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.text = input
        view.delegate = context.coordinator
        return view
    }
    //
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = self.input
        print("UITextView text\(String(describing: uiView.text))")
    }
    
    func makeCoordinator() -> CoordinatorTextView {
        return CoordinatorTextView(input: $input)
    }
}
class CoordinatorTextView: NSObject, UITextViewDelegate {
    var input: Binding<String>
    
    init(input: Binding<String>) {
        self.input = input
    }
    func textViewDidChange(_ textView: UITextView) {
        if let text = textView.text {
            self.input.wrappedValue = text
        }
    }
}

struct TextInputSample: View {
    @State private var testinput = "丰源传媒"
    
    var body: some View {
        VStack (spacing: 15){
            TextView2(input: $testinput)
            
            Button(action: {
                self.testinput = "改变文字"
            }, label: {
                Text("改变文字")
            })
            
            Button(action: {
                print(self.testinput)
            }, label: {
                Text("当前文字")
            })
        }
        
        
        
    }
}

struct TextInputSample_Previews: PreviewProvider {
    static var previews: some View {
        TextInputSample()
    }
}
