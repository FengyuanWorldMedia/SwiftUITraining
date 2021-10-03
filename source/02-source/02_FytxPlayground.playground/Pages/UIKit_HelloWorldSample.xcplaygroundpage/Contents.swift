// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import UIKit
import SwiftUI
import PlaygroundSupport
var greeting = "丰源天下传媒，Hello world!"
print("\(greeting)")
class MyLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    func initializeLabel() {
        self.textAlignment = .left
        self.font = UIFont(name: "Halvetica", size: 17)
        self.textColor = UIColor.red
        self.text = "丰源天下传媒，Hello world!"
    }
}
class FYTXViewController: UIViewController {
    var myLabel : MyLabel?
    // This allows you to initialise your custom UIViewController without a nib or bundle.
    convenience init() {
        self.init(nibName:nil, bundle:nil)
    }
    // This extends the superclass.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    // This is also necessary when extending the superclass.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     override func viewDidLoad() {
          super.viewDidLoad()
          let view = UIView()
          view.backgroundColor = .cyan
         // myLabel = MyLabel(frame: CGRect(x: self.view.frame.size.width / 2,
         // y: self.view.frame.size.height / 2,
         // width: 100, height: 20))
         myLabel = MyLabel(frame: CGRect(x: 100,
                                        y: 100,
                                        width: 300, height: 20))
         view.addSubview(myLabel!)
         self.view = view
     }
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = FYTXViewController()


//let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
//alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"),
//                              style: .default,
//                              handler: { _ in
//                                print("The \"OK\" alert occured.")
//                              }))
// self.present(alert, animated: true, completion: nil)


//PlaygroundPage.current.needsIndefiniteExecution = true
//let window = UIWindow()
//let viewController = FYTXViewController()

//window.rootViewController = viewController
//window.makeKeyAndVisible()

//let alert = UIAlertController(title: "title here", message: "message here", preferredStyle: .alert)
//alert.addAction(UIAlertAction(title: "action here", style: .default, handler: nil))
//viewController.present(alert, animated: true, completion: nil)

//PlaygroundPage.current.liveView = FYTXViewController()
//PlaygroundPage.current.needsIndefiniteExecution = true


//final class MyViewController: UIViewController {
//
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .green
//
//        let button = UIButton(type: .custom)
//        button.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
//        button.setTitle("Tap to go to Detail View", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.isUserInteractionEnabled = true
//        button.addTarget(self, action: #selector(buttonDidTap), for: .touchDown)
//
//        view.addSubview(button)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        self.view = view
//    }
//
//    @objc
//    private func buttonDidTap() {
//        let controller = DetailViewController()
//        present(controller, animated: true, completion: nil)
//    }
//
//}
//
//final class DetailViewController: UIViewController {
//
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .orange
//
//        let button = UIButton(type: .custom)
//        button.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
//        button.setTitle("Tap to dismiss view", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.isUserInteractionEnabled = true
//        button.addTarget(self, action: #selector(buttonDidTap), for: .touchDown)
//
//        view.addSubview(button)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        view.addSubview(button)
//        self.view = view
//    }
//
//    @objc
//    private func buttonDidTap() {
//        dismiss(animated: true, completion: nil)
//    }
//
//}

// set the view and indefiniteexecution
//PlaygroundPage.current.needsIndefiniteExecution = true
//PlaygroundPage.current.liveView = MyViewController()
