//
//  ViewController.swift
//  SampleSwift
//
//  Created by Pallab Maiti on 19/06/23.
//

import UIKit
import RudderKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonTap(_ button: UIButton) {
        let logger = Logger(logLevel: .debug)
        logger.logDebug("")
    }
}

