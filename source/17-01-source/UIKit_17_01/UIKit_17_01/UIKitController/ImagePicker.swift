// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    let completionHandler: (UIImage?) -> Void
    
    typealias UIViewControllerType = UIImagePickerController
    // 创建初始视图控制器
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        // 设置Delegate，响应操作动作。
        picker.delegate = context.coordinator
        return picker
    }

    // SwiftUI状态更改时让我们更新视图控制器
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        //
    }
    // 添加 UIImagePickerController 的 委托
    func makeCoordinator() -> Coordinator {
          return Coordinator(completionHandler: completionHandler)
    }
    // 创建 UIImagePickerController 的 委托
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let completionHandler: (UIImage?) -> Void
        
        init(completionHandler: @escaping (UIImage?) -> Void) {
            self.completionHandler = completionHandler
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            print("Coordinator:: You hava selected a picture")
            let image: UIImage? = {
                if let image = info[.editedImage] as? UIImage {
                    return image
                }
                return info[.originalImage] as? UIImage
            }()
            completionHandler(image)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            completionHandler(nil)
        }
    }
}

struct ImagePicker: View {
      @State private var image: Image?
      @State private var showingImagePicker = false

      var body: some View {
        VStack(spacing: 15) {
              image?
                  .resizable()
                  .scaledToFit()

              Button("选择一个图片") {
                 self.showingImagePicker = true
              }
          }
          .sheet(isPresented: $showingImagePicker) {
            ImagePickerView(completionHandler: {
                imageFromPicker in
                if let m = imageFromPicker {
                    print("You hava selected a picture")
                    image = Image(uiImage: m)
                }
                showingImagePicker = false
            })
          }
      }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}
