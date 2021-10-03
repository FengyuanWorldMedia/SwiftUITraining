// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct Book13_01 {
   var title: String
}
struct BookViewModel13_01: Identifiable {
   var id = UUID()
   var book: Book13_01
}
class AppData13_01: ObservableObject {
   @Published var userData: [BookViewModel13_01] = []

   let publisher = NotificationCenter.Publisher(center: .default,
                                                name: Notification.Name("Update Data"))
                                                .receive(on: RunLoop.main)

   func addBook(book: Book13_01) {
      userData.append(BookViewModel13_01(book: book))
      let center = NotificationCenter.default
      let notification = Notification(name: Notification.Name("Update Data"), object: userData.count, userInfo: nil)
      center.post(notification)
   }
}
