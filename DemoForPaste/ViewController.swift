//
//  ViewController.swift
//  DemoForPaste
//
//  Created by Lee Danatech on 2022/6/16.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MLTPerformance.traceEnd(.open)
    }

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    // MARK: - Action Functions
    @IBAction func click(_ sender: Any) {
        (0..<10000).forEach { _ in
            ServiceAPI.shared.send(URL(string: "https://httpbin.org/post")!, method: .post) { _ in
            }
            ServiceAPI.shared.send(URL(string: "https://httpbin.org/get")!, method: .get) { _ in
            }
        }
    }
}
