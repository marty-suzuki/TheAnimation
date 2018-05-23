//
//  UsingTheAnimation.swift
//  TheAnimationExample
//
//  Created by Carlos on 23/5/18.
//  Copyright © 2018 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation
import TheAnimation

#if os(iOS)
import UIKit
public typealias View = UIView
public typealias Color = UIColor
public typealias BezierPath = UIBezierPath
#elseif os(OSX)
import AppKit
import CoreGraphics
public typealias View = NSView
public typealias Color = NSColor
public typealias BezierPath = NSBezierPath

extension NSBezierPath {
    var cgPath: CGPath {
        var immutablePath: CGPath
        let numElements = elementCount
        let path = CGMutablePath()
        let points = NSPointArray.allocate(capacity: 3)
        var didClosePath = true
        for i in 0..<numElements {
            switch element(at: i, associatedPoints: points) {
            case .moveToBezierPathElement:
                path.move(to: CGPoint(x: points[0].x, y: points[0].y), transform: .identity)
            case .lineToBezierPathElement:
                path.addLine(to: CGPoint(x: points[0].x, y: points[0].y), transform: .identity)
                didClosePath = false
            case .curveToBezierPathElement:
                path.addCurve(to: CGPoint(x: points[2].x, y: points[2].y),
                              control1: CGPoint(x: points[0].x, y: points[0].y),
                              control2: CGPoint(x: points[1].x, y: points[1].y),
                              transform: .identity)
                didClosePath = false
            case .closePathBezierPathElement:
                path.closeSubpath()
                didClosePath = true
            }
        }
        if !didClosePath {
            path.closeSubpath()
        }
        immutablePath = path.copy()!
        return immutablePath
    }
}
#endif

func performAnimation(view: View, circleLayer: CAShapeLayer) {
    
    let size = CGSize(width: view.bounds.size.width,
                      height: view.bounds.size.width)
    
    ConfigureCircleLayer: do {
        let y = (view.bounds.height - size.height) / 2
        circleLayer.frame = CGRect(x: 0, y: y, width: size.width, height: size.height)
        circleLayer.fillColor = Color.green.cgColor
        circleLayer.needsDisplayOnBoundsChange = true
        #if os(iOS)
        view.layer.addSublayer(circleLayer)
        #elseif os(OSX)
        view.wantsLayer = true
        view.layer!.addSublayer(circleLayer)
        #endif
    }
    
    Animation: do {
        let startSize = CGSize(width: 100, height: 100)
        let inset = (size.width / 2) - (startSize.width / 2)
        let startRect = circleLayer.bounds.insetBy(dx: inset, dy: inset)
        let startPath = BezierPath(ovalIn: startRect).cgPath
        circleLayer.path = startPath
        
        let pathAnimation = BasicAnimation(keyPath: .path)
        pathAnimation.toValue = BezierPath(ovalIn: CGRect(origin: .zero, size: size)).cgPath
        pathAnimation.duration = 2
        pathAnimation.timingFunction = .easeOut
        pathAnimation.fillMode = .forwards
        pathAnimation.isRemovedOnCompletion = false
        
        let fadeOutAnimation = BasicAnimation(keyPath: .opacity)
        fadeOutAnimation.fromValue = 1
        fadeOutAnimation.toValue   = 0
        fadeOutAnimation.duration  = 1
        fadeOutAnimation.beginTime = 2
        
        let animationGroup = AnimationGroup()
        animationGroup.duration = pathAnimation.duration + fadeOutAnimation.duration
        animationGroup.repeatCount = .infinity
        animationGroup.animations = [pathAnimation, fadeOutAnimation]
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = false
        
        let canceller = animationGroup.animate(in: circleLayer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7)) {
            canceller.cancelAnimation()
        }
    }
}
