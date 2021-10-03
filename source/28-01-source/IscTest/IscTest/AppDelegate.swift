// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.
//
import SwiftUI
import Foundation

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("app startup")
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func application(  _ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions ) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = FySceneDelegate.self
        return sceneConfig
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url)
        AppVar.linkInfo = url.absoluteString
        AppVar.envObj.showDialog = true
        return true
    }
    
    /// 不会被启动
//    // https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        // Determine who sent the URL.
//
//        AppVar.openMethod = "application#open url"
//        exit(0)
//
//        let sendingAppID = options[.sourceApplication]
//        print("source application = \(sendingAppID ?? "Unknown")")
//        // Process the URL.
//        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
//              let albumPath = components.path,
//              let params = components.queryItems else {
//                  print("Invalid URL or album path missing")
//                  return false
//        }
//
//        DispatchQueue.main.asyncAfter(wallDeadline: .now() + .seconds(5), execute: {
//            AppVar.linkInfo = url.absoluteString
//            AppVar.envObj.showDialog = true
//            print("on")
//            exit(0)
//        })
//
//        if let photoIndex = params.first(where: { $0.name == "index" })?.value {
//            print("albumPath = \(albumPath)")
//            print("photoIndex = \(photoIndex)")
//            return true
//        } else {
//            print("Photo index missing")
//            return false
//        }
////        print("app url \(url.query)")
////        print("app url \(url.absoluteString)")
////        return true
//    }
}
