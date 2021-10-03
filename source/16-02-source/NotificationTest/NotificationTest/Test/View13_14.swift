// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

import SwiftUI
import UserNotifications

struct View13_14: View {
   @State private var inputMessage: String = "这是一个分组通知，祝您生活愉快。"
   @State private var isButtonEnabled: Bool = false

   var body: some View {
      VStack(spacing: 13) {
         HStack {
            Text("Message:")
            TextField("Message", text: $inputMessage)
               .textFieldStyle(RoundedBorderTextFieldStyle())
         }
         HStack {
            Spacer()
            Button("Notification") {
               let message = self.inputMessage.trimmingCharacters(in: .whitespaces)
               if !message.isEmpty {
                  self.postNotification()
                  self.inputMessage = ""
               }
            }.disabled(!isButtonEnabled)
         }
         Spacer()
      }.padding()
      .onAppear(perform: {
         self.getAuthorization()
      })
   }
   func getAuthorization() {
      let center = UNUserNotificationCenter.current()
      center.getNotificationSettings(completionHandler: { settings in
         if settings.authorizationStatus == .authorized {
            self.isButtonEnabled = true
         } else {
            center.requestAuthorization(options: [.alert, .sound], completionHandler: { granted, error in
               if granted && error == nil {
                  self.isButtonEnabled = true
               } else {
                  self.isButtonEnabled = false
               }
            })
         }
      })
   }
   func postNotification() {
      let center = UNUserNotificationCenter.current()
   
      for index in 1...5 {
         let content = UNMutableNotificationContent()
         content.title = "Reminder"
         content.body = self.inputMessage + " Attempt: \(index)"
         content.threadIdentifier = index < 3 ? "Group One" : "Group Two" 
         let time = Double(1 * index)
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
         let id = "reminder-\(stringWithUUID())"
         print(id)
         let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
         center.add(request, withCompletionHandler: nil)
      }
   }
    
    func stringWithUUID() -> String {
      let uuidObj = CFUUIDCreate(nil)
      let uuidString = CFUUIDCreateString(nil, uuidObj)!
      return uuidString as String
     }
}

struct View13_14_Previews: PreviewProvider {
    static var previews: some View {
        View13_14()
    }
}
