// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 15) {
            Text("hello")
            
            Text("good morning")
                .environment(\.locale, .init(identifier: "ja"))
            
            Text("With parameter:\("丰源天下传媒")")
            
        }.onAppear() {
            
            print("hello".localized())
            print("good morning".localized(withComment: "Simple greeting"))
            print("With parameter:%@15916516516".LWithParam(parameters: ["丰源天下传媒"]))
            print("current language: \(String.getCurrentLanguage())")
        }
    }
}

extension String {
    func localized(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: "Simple greeting")
    }
    // "Welcome %@, this is my app"
    func LWithParam(parameters: [String]) -> String {
        return String(format: NSLocalizedString(self, comment: "222"), arguments: parameters)
    }
    
    static func getCurrentLanguage() -> String {
            let preferredLang = Bundle.main.preferredLocalizations.first! as NSString
            print("当前系统语言:\(preferredLang)")
            switch String(describing: preferredLang) {
            case "en-US", "en-CN", "en":
                return "en"//英文
            case "zh-Hans-US","zh-Hans-CN","zh-Hant-CN","zh-TW","zh-HK","zh-Hans":
                return "cn"//中文
            case "ja" :
                return "ja"
            default:
                return ""
            }
     }


}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//           ContentView()
//               .environment(\.locale, .init(identifier: "zh-Hans"))
//           ContentView()
//               .environment(\.locale, .init(identifier: "en"))
//            ContentView()
//                .environment(\.locale, .init(identifier: "ja"))
//         }
//    }
//}
