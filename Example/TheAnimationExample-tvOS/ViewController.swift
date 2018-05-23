//
//  ViewController.swift
//  TheAnimationExample-tvOS
//
//  Created by Carlos on 23/5/18.
//  Copyright © 2018 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let circleLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performAnimation(view: view, circleLayer: circleLayer)
    }
}

