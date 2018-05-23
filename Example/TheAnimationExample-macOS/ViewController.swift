//
//  ViewController.swift
//  TheAnimationExample-macOS
//
//  Created by Carlos on 23/5/18.
//  Copyright © 2018 marty-suzuki. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let circleLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        performAnimation(view: view, circleLayer: circleLayer)
    }
    
}
