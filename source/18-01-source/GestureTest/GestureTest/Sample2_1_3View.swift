// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
struct PictureView: View {
   @EnvironmentObject var appData: AppData
    
   @State private var offset = CGSize.zero
   var picture: Picture

   var body: some View {
      Image(picture.image)
         .resizable()
         .scaledToFit()
         .offset(offset)
         .gesture(DragGesture(coordinateSpace: .global)
            .onChanged { value in
               self.appData.dropOver = self.appData.dropFrame.contains(value.location)
               self.offset = value.translation
            }
            .onEnded { value in
               if self.appData.dropOver {
                  self.appData.selected = self.picture.image
                  self.appData.remove(id: self.picture.id)
                  self.appData.dropOver = false
               } else {
                  self.offset = CGSize.zero
               }
            }
         )
   }
}

struct Picture: Identifiable {
   var id: UUID = UUID()
   var image: String
}
class AppData: ObservableObject {
   @Published var userData: [Picture]
    
   @Published var selected: String? = nil
   @Published var dropFrame: CGRect = CGRect.zero
   @Published var dropOver: Bool = false

   init() {
      userData = [
         Picture(image: "spot1"),
         Picture(image: "spot2"),
         Picture(image: "spot3")
      ]
   }
   func remove(id: UUID) {
      if let index = userData.firstIndex(where: { $0.id == id }) {
         userData.remove(at: index)
      }
   }
}

struct Sample2_1_3View: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
       VStack {
          HStack(spacing: 10) {
             ForEach(self.appData.userData) { picture in
                PictureView(picture: picture)
             }
          }
          .frame(minWidth: 0, maxWidth: .infinity)
          .frame(height: 100)

          GeometryReader { geometry in
            VStack {
                Text(geometry.frame(in: .global).debugDescription)
//                    .onAppear(){
//                        DispatchQueue.main.async {
//                            print("2222")
//                            self.appData.dropFrame = geometry.frame(in: .global)
//                            print(geometry.frame(in: .global))
//                        }
//                        print("1111")
//                    }
                Image(self.appData.selected ?? "nopicture")
                   .resizable()
                   .scaledToFill()
                   .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                   .clipped()
                   .overlay(self.appData.dropOver ? Color.green.opacity(0.2) : Color.clear)
             }
            .onChange(of: geometry.frame(in: .global), perform: { value in
                self.appData.dropFrame = value
            })
             .border(Color.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
          }.zIndex(-1)
       }
    }
}

struct Sample2_1_3View_Previews: PreviewProvider {
    static var previews: some View {
        Sample2_1_3View()
    }
}
