//
//  SpringAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public typealias SpringAnimation<ValueType: AnimationValueType> = PrimitiveAnimation<CASpringAnimation, ValueType>

extension PrimitiveAnimation where RawAnimation == CASpringAnimation {
    public var mass: CGFloat {
        set { _animation.mass = newValue }
        get { return _animation.mass }
    }

    public var stiffness: CGFloat {
        set { _animation.stiffness = newValue }
        get { return _animation.stiffness }
    }

    public var damping: CGFloat {
        set { _animation.damping = newValue }
        get { return _animation.damping }
    }

    public var initialVelocity: CGFloat {
        set { _animation.initialVelocity = newValue }
        get { return _animation.initialVelocity }
    }

    public var settlingDuration: TimeInterval {
        return _animation.settlingDuration
    }
}
