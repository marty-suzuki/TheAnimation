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

public protocol Animation: AnyObject {
    var animation: CAAnimation { get }
    var key: String { get }
}

public enum AnimationStatus {
    case didStart
    case didStop(finished: Bool)
}

extension Animation {
    public var animationHandler:  ((AnimationStatus) -> Void)? {
        set { animation._delegateProxy.handler = newValue }
        get { return animation._delegateProxy.handler }
    }

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

    public static func defaultValue<T: AnimationValueType>(for keyPath: AnimationKeyPath<T>) -> T? {
        return CAAnimation.defaultValue(forKey: keyPath.rawValue) as? T
    }

    public func shouldArchiveValue<T: AnimationValueType>(for keyPath: AnimationKeyPath<T>) -> Bool {
        return animation.shouldArchiveValue(forKey: keyPath.rawValue)
    }

    public func run(forKey event: String, object anObject: Any, arguments dict: [AnyHashable : Any]?) {
        animation.run(forKey: event, object: anObject, arguments: dict)
    }

    @discardableResult
    public func animate(in layer: CALayer) -> AnimationCanceller {
        layer.add(animation, forKey: key)
        return AnimationCanceller(layer: layer, key: key)
    }

    @discardableResult
    public func animate(in view: View) -> AnimationCanceller {
        #if os(iOS) || os(watchOS) || os(tvOS)
        return animate(in: view.layer)
        #elseif os(OSX)
        view.wantsLayer = true
        if let layer = view.layer {
            return animate(in: layer)
        } else {
            fatalError("view.layer is nil in \(#file)_\(#function)_\(#line)")
        }
        #endif
    }
}

private let _delegateProxyKey = UnsafeMutablePointer<Void>.allocate(capacity: 1)

extension CAAnimation {
    fileprivate var _delegateProxy: CAAnimationDelegateProxy{
        let dp: CAAnimationDelegateProxy
        if let _dp = objc_getAssociatedObject(self, _delegateProxyKey) as? CAAnimationDelegateProxy {
            dp = _dp
        } else {
            dp = CAAnimationDelegateProxy()
            objc_setAssociatedObject(self, _delegateProxyKey, dp, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        delegate = dp
        return dp
    }
}

public struct FillMode {

    #if swift(>=4.2)
    typealias RawValue = CAMediaTimingFillMode
    public static let forwards  = FillMode(rawValue: .forwards)
    public static let backwards = FillMode(rawValue: .backwards)
    public static let both      = FillMode(rawValue: .both)
    public static let removed   = FillMode(rawValue: .removed)
    #else
    typealias RawValue = String
    public static let forwards  = FillMode(rawValue: kCAFillModeForwards)
    public static let backwards = FillMode(rawValue: kCAFillModeBackwards)
    public static let both      = FillMode(rawValue: kCAFillModeBoth)
    public static let removed   = FillMode(rawValue: kCAFillModeRemoved)
    #endif

    let rawValue: RawValue
}

public struct AnimationCanceller {
    let layer: CALayer
    let key: String

    public func cancelAnimation() {
        layer.removeAnimation(forKey: key)
    }
}
