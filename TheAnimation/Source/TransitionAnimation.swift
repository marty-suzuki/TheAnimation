//
//  TransitionAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import CoreGraphics

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
    public static let fade   = TransitionType(rawValue: kCATransitionFade)
    public static let moveIn = TransitionType(rawValue: kCATransitionMoveIn)
    public static let push   = TransitionType(rawValue: kCATransitionPush)
    public static let reveal = TransitionType(rawValue: kCATransitionReveal)

    let rawValue: String
}

public struct TransitionSubtype {
    public static let right  = TransitionSubtype(rawValue: kCATransitionFromRight)
    public static let left   = TransitionSubtype(rawValue: kCATransitionFromLeft)
    public static let top    = TransitionSubtype(rawValue: kCATransitionFromTop)
    public static let bottom = TransitionSubtype(rawValue: kCATransitionFromBottom)

    let rawValue: String
}
