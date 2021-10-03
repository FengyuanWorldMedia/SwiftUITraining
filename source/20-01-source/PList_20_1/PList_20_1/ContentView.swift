// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    // https://developer.apple.com/documentation/bundleresources/information_property_list/bundle_configuration
    var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    var appName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    var appId: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text("App 版本: \(appVersion!)")
            Text("App 名称: \(appName!)")
            Text("App BundleId: \(appId!)")
            Button(action: {
                getInfoFromPlist()
            }, label: {
                Text("获取Info.plist里的所有信息")
            })
        }
    }
    /// 获取Info.plist里的所有信息
    private func getInfoFromPlist() {
        var config: [String: Any]?
        if let infoPlistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    config = dict
                }
            } catch {
                print(error)
            }
        }
        print(config!["CFBundlePackageType"] as! String)
        print(config?.description)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
