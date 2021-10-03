// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    @State private var url = HttpLinkEnum.TestURL.rawValue
    
    @State private var schemeUrl = "fytx://page?param=value1"
    
    @EnvironmentObject var envObj: EnvObj
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextEditor(text: $url)
                        .foregroundColor(.secondary)
//                        .padding(.bottom, 20)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                      .stroke(Color.yellow, lineWidth: 1)
                ).padding(5)
                    .frame(height: 110)
                
                NavigationLink( destination: gotoWebView(), label: {
                    Text("Open Web Page").frame(width: 300)
                })
                
                TextEditor(text: $schemeUrl)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .frame(height: 80)
                    .padding(.bottom, 5)
                
                Button("TestScheme", action: {
                    let url = URL( string: self.schemeUrl)!
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                })
                Spacer()
            }.background(Color(.orange))
                .navigationTitle("UrlSchemeTest")
                .edgesIgnoringSafeArea(.bottom)
                .alert(isPresented: $envObj.showDialog) {
                    Alert(title: Text("Show Link Method"),
                          message: Text("Opened by URL Scheme, \n URL : \(AppVar.linkInfo)"),
                          dismissButton: .destructive(Text("OK")) {
                            // UIHelper.gotoLoginPage()
                    })
                }
            
        }
    }
    
    private func gotoWebView() -> some View {
        SimpleWebView(httpStr: self.url, title: "UrlSchemeTest")
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
            .edgesIgnoringSafeArea(.bottom)
    }
    
}
 
 
