// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation
import SwiftUI

// https://www.fivestars.blog/articles/app-delegate-scene-delegate-swiftui/

// UISceneDelegate
// UIWindowSceneDelegate

class FySceneDelegate: NSObject, UISceneDelegate {
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // ...
        print("sceneWillEnterForeground")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // ...
        print("sceneDidBecomeActive")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("sceneWillResignActive")
    }
    
    // https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app
    func scene(_ scene: UIScene,  willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("willConnectTo")
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print("openURLContexts")
        AppVar.openMethod = "FySceneDelegate#openURLContexts"
        if let urlContext = URLContexts.first {
            let sendingAppID = urlContext.options.sourceApplication
            let url = urlContext.url
            print("source application = \(sendingAppID ?? "Unknown")")
            print("url = \(url)")
            AppVar.linkInfo = url.absoluteString
            AppVar.envObj.showDialog = true
            // Process the URL similarly to the UIApplicationDelegate example.
        }
    }
    
    
    
}
