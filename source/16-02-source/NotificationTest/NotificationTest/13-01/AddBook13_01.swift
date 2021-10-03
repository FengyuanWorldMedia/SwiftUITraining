// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI

struct AddBook13_01: View {
    @EnvironmentObject var appData: AppData13_01
    
   @Environment(\.presentationMode) var presentation
   @State private var titleInput: String = ""

   var body: some View {
      VStack {
         HStack {
            Text("Title")
            TextField("Insert title", text: $titleInput)
               .textFieldStyle(RoundedBorderTextFieldStyle())
         }
         HStack {
            Spacer()
            Button("Save") {
                let book = Book13_01(title: "123")
                self.appData.addBook(book: book)
                self.presentation.wrappedValue.dismiss()
            }
         }
         Spacer()
      }.padding()
      .navigationBarTitle("Add Book")
   }
}

struct AddBook13_01_Previews: PreviewProvider {
    static var previews: some View {
        AddBook13_01()
    }
}
