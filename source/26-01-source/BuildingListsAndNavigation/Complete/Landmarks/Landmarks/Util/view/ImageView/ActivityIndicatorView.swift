// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

// Flower loading
struct ActivityIndicator1View: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator1View>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator1View>) {
        uiView.startAnimating()
    }
}


// Loading...
struct ActivityIndicator2View: View {
    
    @State var text = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("Loading \(text)")
            .font(.system(size: 17)).bold()
            .transition(.slide)
            .onReceive(timer, perform: { (_) in
                if self.text.count == 3 {
                    self.text = ""
                } else {
                    self.text += "."
                }
            })
            .onAppear() {
                self.text = "."
            }
    }
}



// loading bar
struct ActivityIndicator3View: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var width: CGFloat = 10
    @State var progress: CGFloat = 10
    @State var capsuleWidth: CGFloat = 100
    
    var body: some View {
        ZStack {
            Capsule()
                .stroke(Color.gray)
                .frame(width: capsuleWidth, height: 20)
            .overlay(
                VStack (alignment: .leading) {
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: self.width, height: 15, alignment: .leading)
                        .padding([.leading, .trailing], 5)
                        .animation(Animation.linear(duration: 0.5))
                }.frame(width: capsuleWidth, height: 20, alignment: .leading)
            ).onReceive(timer) { (_) in
                self.width += self.progress
                if self.width >= self.capsuleWidth {
                    self.width = 0
                }
            }
        }
    }
}

// App icon loading
struct ActivityIndicator4View: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let style = StrokeStyle(lineWidth: 6, lineCap: .round)
    let color = Color.gray
    let colorBG = Color.gray.opacity(0.3)
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(AngularGradient(gradient: .init(colors: [colorBG]), center: .center), style: style)
            
            Circle()
                .trim(from: 0.0, to: self.progress)
                .stroke(AngularGradient(gradient: .init(colors: [color]), center: .center), style: style)
                .onReceive(timer) { (_) in
                    self.progress += 0.1
                    if self.progress >= 1 {
                        self.progress = 0
                    }
                }
        }
    }
}

