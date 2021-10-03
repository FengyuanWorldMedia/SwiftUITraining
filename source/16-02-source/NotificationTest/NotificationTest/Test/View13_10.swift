// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
import UserNotifications

struct View13_10: View {
   @State private var inputMessage: String = "今天是晴天，祝你生活愉快。"
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
            Button("Send") {
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
      /// 创建一个通知中心来安排和管理用户通知，默认的是NotificationCenter.default对象
      /// 返回对分配给应用程序的UNUserNotificationCenter对象的引用
      let center = UNUserNotificationCenter.current()
      /// getNotificationSettings，此方法获取设备上的当前配置集以传递通知并发送
      center.getNotificationSettings(completionHandler: { settings in
         if settings.authorizationStatus == .authorized {
            self.isButtonEnabled = true
         } else {
            /// requestAuthorization 此方法向用户请求授权以显示通知
            ///     options属性是一组属性，这些属性确定我们要显示的通知的类型。
            ///         可用的属性包括【徽章，声音，警报，carPlay，criticalAlert和临时】属性
            /// completeHandler 属性是一个闭包，它在收到用户的响应后执行
            ///     参数一：布尔值（确定是否授予了权限）和
            ///     参数二：Error值，用于报告错误
            center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { granted, error in
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
        /// 显示给用户的通知
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = self.inputMessage
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "piano.mp3"))
        // UIApplication.shared.applicationIconBadgeNumber = 10
        // content.badge = UIApplication.shared.applicationIconBadgeNumber as NSNumber
        content.badge = 10
        
        /// 该初始化程序创建一个Time Interval触发器，该触发器将在timeInterval属性确定的时间段（以秒为单位）之后传递通知。
        /// UNCalendarNotificationTrigger（dateMatching：DateComponents，repeats：Bool)
        ///     --- 该初始化程序创建一个Calendar触发器，该触发器在dateMatching属性确定的日期传递通知。
        ///       repeats属性确定通知将被发送一次还是无限次。
        /// UNLocationNotificationTrigger（region：CLRegion，repeats：Bool）
        ///     --  当设备位于由region属性确定的现实世界中的某个区域内时，该触发器将发送通知。
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        /// 请求标识符必须是唯一的。 为了给每个请求分配一个唯一值，
        /// 我们创建了一个带有单词“ reminder”的字符串，后跟一个由UUID（）函数生成的随机值。
        let id = "reminder-\(UUID())"
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)

    }
    
    //    func createSoundFile() {
    //        // create file <App>/Library/Sounds
    //        let libraryUrl = FileSwiftUIManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
    //        let soundDirUrl = libraryUrl.appendingPathComponent("Sounds")
    //        try? FileSwiftUIManager.default.createDirectory(at: soundDirUrl, withIntermediateDirectories: true, attributes: nil)
    //        //  copy file to ${App}/Library/Sounds
    //        do {
    //            let mp3path = Bundle.main.path(forResource: "alarm", ofType: "mp3")!
    //            let mp3url = URL(fileURLWithPath: mp3path)
    //            // let from =  mp3url.appendingPathComponent("alarm.mp3")
    //            let dest = soundDirUrl.appendingPathComponent("alarm.mp3")
    //            try FileSwiftUIManager.default.copyItem(at: mp3url, to: dest)
    //        } catch {
    //           print(error)
    //        }
    //    }
    
    
}

struct View13_10_Previews: PreviewProvider {
    static var previews: some View {
        View13_10()
    }
}
