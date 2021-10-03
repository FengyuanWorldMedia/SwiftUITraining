// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var splashWindow: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        // Create the SwiftUI view that provides the window contents.
        
        let contentView = ContentView()
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
          
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        let delegate = UIApplication.shared.delegate as! AppDelegate
        if !delegate.isFistTime {
            createSplashView(scene)
        }
        delegate.isFistTime = false
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}


extension SceneDelegate {
    func createSplashView(_ scene: UIScene) {
      // extend Splash screen only if `splashWindow` is `nil` otherwise it is already shown.
      if let launchStoryboardName = InfoPList.launchStoryboardName, let windowScene = self.window?.windowScene {
          splashWindow = splashWindow ??
          {
              let window = UIWindow(windowScene: windowScene)
              window.windowLevel = .statusBar
              let storyboard = UIStoryboard(name: launchStoryboardName, bundle: nil)
              let imageArr = ["tiger1.jpeg","crane1.jpeg"]

              let RandomNumber = Int(arc4random_uniform(UInt32(imageArr.count)))
               //imageArr is array of images
              let image = UIImage.init(named: "\(imageArr[RandomNumber])")
              
              let imageView = UIImageView.init(image: image)
              imageView.frame = UIScreen.main.bounds
              window.rootViewController = storyboard.instantiateInitialViewController()
              window.rootViewController?.view.addSubview(imageView)
              window.rootViewController?.view.bringSubviewToFront(imageView)
              window.makeKeyAndVisible()

              // ⏳Wait for 5 seconds, then remove.
              DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                  UIView.animate(withDuration: -1, // system default
                      animations: {
                          self.splashWindow?.alpha = 0
                      },
                      completion: { _ in
                          self.splashWindow?.isHidden = true
                          self.splashWindow = nil
                      }
                  )
              }
              return window
          }()
      }
    }
}


//
// PList Helper
struct InfoPList
{
    private static func value(for name: String) -> String? { Bundle.main.object(forInfoDictionaryKey: name) as? String }
    static var bundleIdentifier: String? { self.value(for: "CFBundleIdentifier") }
    static var bundleDisplayName: String? { self.value(for: "CFBundleDisplayName") }
    static var bundleShortVersionString: String? { self.value(for: "CFBundleShortVersionString") }
    static var bundleVersion: String? { self.value(for: "CFBundleVersion") }
    static var launchStoryboardName: String? { self.value(for: "UILaunchStoryboardName") }
    static var mainStoryboardName: String? { self.value(for: "UIMainStoryboardFile") }
}
