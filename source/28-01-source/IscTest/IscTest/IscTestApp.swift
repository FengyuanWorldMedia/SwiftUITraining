// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
// https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app

@main
struct IscTestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppVar.envObj)
                .onOpenURL(perform: handleURL)
        }
    }
    func handleURL(_ url: URL) {
        AppVar.linkInfo = url.absoluteString
        AppVar.envObj.showDialog = true
    }
}


