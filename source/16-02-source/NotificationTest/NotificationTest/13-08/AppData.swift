// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Book111 {
   var title: String
}

struct BookViewModel111: Identifiable {
   var id = UUID()
   var book: Book111
}

class AppData: ObservableObject {
    @Published var userData: [BookViewModel111] = []

   let openPublisher = NotificationCenter.Publisher(center: .default, name: UIWindow.keyboardWillShowNotification)
      .map({ notification -> CGFloat in
         if let info = notification.userInfo {
            let value = info[UIWindow.keyboardFrameEndUserInfoKey] as! NSValue
            let height = value.cgRectValue.height
            return height
         } else {
            return 0
         }
      })
      .receive(on: RunLoop.main)

   let closePublisher = NotificationCenter.Publisher(center: .default, name: UIWindow.keyboardDidHideNotification)
      .receive(on: RunLoop.main)
}
