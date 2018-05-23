//
//  ViewController.swift
//  TheAnimationExample
//
//  Created by marty-suzuki on 2018/05/12.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let circleLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        performAnimation(view: view, circleLayer: circleLayer)
    }
}

