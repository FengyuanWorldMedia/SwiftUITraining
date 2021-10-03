// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct BtnStyleTestView: View {
    @State private var isDisabled = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isDisabled = true
            }, label: {
                Text("Click Me")
            })
            .foregroundColor(Color.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
            .disabled(isDisabled)
            .buttonStyle(DisableButtonStyle())
            // click this button recovery to active
            Button(action: {
                self.isDisabled = false
            }, label: {
                Text("Recovery")
            })
            .foregroundColor(Color.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
        }
        
    }
    
}

struct DisableButtonStyle:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        DisableAdapter(configuration: configuration)
    }
    struct DisableAdapter: View {
        let configuration : ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled:Bool
        var body: some View {
            configuration.label.opacity(isEnabled ? 1 : 0.3)
        }
    }
}

struct BtnStyleTestView_Previews: PreviewProvider {
    static var previews: some View {
        BtnStyleTestView()
    }
}
