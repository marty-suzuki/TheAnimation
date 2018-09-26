//
//  TransitionAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public final class TransitionAnimation: Animation {
    public var animation: CAAnimation {
        return _animation
    }

    public let key: String

    let _animation: CATransition

    public var type: TransitionType {
        set { _animation.type = newValue.rawValue }
        get { return TransitionType(rawValue: _animation.type) }
    }

    public var subtype: TransitionSubtype? {
        set { _animation.subtype = newValue?.rawValue }
        get { return _animation.subtype.map(TransitionSubtype.init) }
    }

    public var startProgress: TimeInterval {
        set { return _animation.startProgress = Float(newValue) }
        get { return TimeInterval(_animation.startProgress) }
    }

    public var endProgress: TimeInterval {
        set { return _animation.endProgress = Float(newValue) }
        get { return TimeInterval(_animation.endProgress) }
    }

    init() {
        self._animation = CATransition()
        self.key = "transition"
    }
}

public struct TransitionType {

    #if swift(>=4.2)
    typealias RawValue = CATransitionType
    public static let fade   = TransitionType(rawValue: .fade)
    public static let moveIn = TransitionType(rawValue: .moveIn)
    public static let push   = TransitionType(rawValue: .push)
    public static let reveal = TransitionType(rawValue: .reveal)
    #else
    typealias RawValue = String
    public static let fade   = TransitionType(rawValue: kCATransitionFade)
    public static let moveIn = TransitionType(rawValue: kCATransitionMoveIn)
    public static let push   = TransitionType(rawValue: kCATransitionPush)
    public static let reveal = TransitionType(rawValue: kCATransitionReveal)
    #endif

    let rawValue: RawValue
}

public struct TransitionSubtype {

    #if swift(>=4.2)
    typealias RawValue = CATransitionSubtype
    public static let right  = TransitionSubtype(rawValue: .fromRight)
    public static let left   = TransitionSubtype(rawValue: .fromLeft)
    public static let top    = TransitionSubtype(rawValue: .fromTop)
    public static let bottom = TransitionSubtype(rawValue: .fromBottom)
    #else
    typealias RawValue = String
    public static let right  = TransitionSubtype(rawValue: kCATransitionFromRight)
    public static let left   = TransitionSubtype(rawValue: kCATransitionFromLeft)
    public static let top    = TransitionSubtype(rawValue: kCATransitionFromTop)
    public static let bottom = TransitionSubtype(rawValue: kCATransitionFromBottom)
    #endif

    let rawValue: RawValue
}
