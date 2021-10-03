// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Button(action: {readSetting()}, label: {
                Text("Read Items")
            })
            Button(action: {updateSetting()}, label: {
                Text("Change url_preference")
            })
            Text("SettingBundle 学习")
                .padding()
                .onAppear() {
                    registerDefaultsFromSettingsBundle()
                    readSetting()
//                    updateSetting()
                    print("updated setting:")
                    readSetting()
                }
        }
    }
    
    private func readSetting() {
        let stanDefaults = UserDefaults.standard
        print("测试标题 - \(stanDefaults.string(forKey: "title_preference") ?? "")")
        print("测试环境 - \(stanDefaults.string(forKey: "test_type") ?? "")")
        print("测试URL - \(stanDefaults.string(forKey: "url_preference") ?? "")")
        print("网络开启状态 - \(stanDefaults.bool(forKey: "enabled_preference"))")
        print("下载速度限制 - \(stanDefaults.float(forKey: "slider_preference"))")
    }
    
    func registerDefaultsFromSettingsBundle(){
        let settingsUrl = Bundle.main.url(forResource: "Settings", withExtension: "bundle")!.appendingPathComponent("Root.plist")
        let settingsPlist = NSDictionary(contentsOf:settingsUrl)!
        let preferences = settingsPlist["PreferenceSpecifiers"] as! [NSDictionary]
        var defaultsToRegister = Dictionary<String, Any>()
        for preference in preferences {
            guard let key = preference["Key"] as? String else {
                NSLog("Key not found")
                continue
            }
            defaultsToRegister[key] = preference["DefaultValue"]
        }
        UserDefaults.standard.register(defaults: defaultsToRegister)
    }
    
    func updateSetting() {
        let stanDefaults = UserDefaults.standard
        stanDefaults.set("http://localhost:9996/index_update.html", forKey: "url_preference")
        stanDefaults.synchronize()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
