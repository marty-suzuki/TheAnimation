//
//  Animation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/12.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
public typealias View = UIView
#elseif os(OSX)
import AppKit
public typealias View = NSView
#endif
import QuartzCore.CoreAnimation

public protocol Animation: class {
    var animation: CAAnimation { get }
    var key: String { get }
    var layer: CALayer { get }
}

extension Animation {
    public var timingFunction: TimingFunction? {
        set { animation.timingFunction = newValue?.rawValue }
        get { return animation.timingFunction.flatMap(TimingFunction.init) }
    }

    public var isRemovedOnCompletion: Bool {
        set { animation.isRemovedOnCompletion = newValue }
        get { return animation.isRemovedOnCompletion }
    }

    public var beginTime: TimeInterval {
        set { animation.beginTime = newValue }
        get { return animation.beginTime }
    }

    public var duration: TimeInterval {
        set { animation.duration = newValue }
        get { return animation.duration }
    }

    public var speed: TimeInterval {
        set { animation.speed = Float(newValue) }
        get { return TimeInterval(animation.speed) }
    }

    public var timeOffset: TimeInterval {
        set { animation.timeOffset = newValue }
        get { return animation.timeOffset }
    }

    public var repeatCount: Double {
        set { animation.repeatCount = Float(newValue) }
        get { return Double(animation.repeatCount) }
    }

    public var repeatDuration: TimeInterval {
        set { animation.repeatDuration = newValue }
        get { return animation.repeatDuration }
    }

    public var autoreverses: Bool {
        set { animation.autoreverses = newValue }
        get { return animation.autoreverses }
    }

    public var fillMode: FillMode {
        set { animation.fillMode = newValue.rawValue }
        get { return FillMode(rawValue: animation.fillMode) }
    }

    public static func defaultValue<T: AnimationValueType, U: CALayer>(for keyPath: AnimationKeyPath<T, U>) -> T? {
        return CAAnimation.defaultValue(forKey: keyPath.rawValue) as? T
    }

    public func shouldArchiveValue<T: AnimationValueType, U: CALayer>(for keyPath: AnimationKeyPath<T, U>) -> Bool {
        return animation.shouldArchiveValue(forKey: keyPath.rawValue)
    }

    public func run(forKey event: String, object anObject: Any, arguments dict: [AnyHashable : Any]?) {
        animation.run(forKey: event, object: anObject, arguments: dict)
    }

    public func startAnimating() {
        layer.add(animation, forKey: key)
    }

    public func stopAnimationg() {
        layer.removeAnimation(forKey: key)
    }

    public func asAnyAnimation() -> AnyAnimation {
        return AnyAnimation(animation: animation, key: key, layer: layer)
    }
}

public struct FillMode {
    public static let forwards  = FillMode(rawValue: kCAFillModeForwards)
    public static let backwards = FillMode(rawValue: kCAFillModeBackwards)
    public static let both      = FillMode(rawValue: kCAFillModeBoth)
    public static let removed   = FillMode(rawValue: kCAFillModeRemoved)

    let rawValue: String
}
