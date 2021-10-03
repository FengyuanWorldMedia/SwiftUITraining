// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

public class SrSdkConfig {
    
    // SDK itself will only have staging and production flavor.
    // then app will have
    // Release -> SDK(isStaging = false)
    // Pre-release -> SDK(isStaging = false)
    // Staging -> SDK(isStaging = true)
    
    private static var _isStaging: Bool?
    public static var isStaging : Bool {
        get {
            if _isStaging == nil {
                fatalError("Current StagingFlag is nil")
            }
            return _isStaging!
        }
        set {
            if _isStaging != nil {
                fatalError("Current StagingFlag is \(String(describing: _isStaging))")
            }
            // create database
            _isStaging = newValue
            
            initialize()
        }
    }
    
    // 20200812 liuqingshang start. For UT-Test.
     private static var _isMockServer: Bool?
     /// This isMockServer is false by defalut.
     /// The next step is to set MockServer url ,If isMockServer  is setted [true].
     /// Mockserver url will be cleared after [isMockServer]  is setted [false].
     public static var isMockServer : Bool {
         get {
             if _isMockServer == nil {
                 fatalError("[_isMockServer] is nil")
             }
             return _isMockServer ?? false
         }
         set {
             if _isStaging == nil || !_isStaging! {
                 fatalError("[isMockServer] can not be setted while [_isStaging] is nil or false")
             }
             if _isMockServer != nil {
                 fatalError("[_isMockServer] is \(String(describing: _isMockServer))")
             }
             _isMockServer = newValue
             // Update BundleSetting.
            UserDefaults.standard.set(_isMockServer, forKey: "enable_mock")
            UserDefaults.standard.synchronize()
         }
    }
    
    
    private static func initialize() {
        // Setting Bundle . MockServerSetting .
        registerSettingsBundle()
    }
    
    private static func registerSettingsBundle() {
          guard let settingsBundle = Bundle.main.path(forResource: "Settings", ofType: "bundle") else
          {
              SrLogUtil.logInfo(string: "Could not locate Settings.bundle")
              return
          }
          guard let settings = NSDictionary(contentsOfFile: settingsBundle + "/Root.plist") else
          {
              SrLogUtil.logInfo(string: "Could not read Root.plist")
              return
          }
          let preferences = settings["PreferenceSpecifiers"] as! NSArray
          var defaultsToRegister = [String: AnyObject]()
          for prefSpecification in preferences {
              if let post = prefSpecification as? [String: AnyObject] {
                  guard let key = post["Key"] as? String,
                      let defaultValue = post["DefaultValue"] else {
                          continue
                  }
                  defaultsToRegister[key] = defaultValue
              }
          }
          UserDefaults.standard.register(defaults: defaultsToRegister)
    }
    
 
}
