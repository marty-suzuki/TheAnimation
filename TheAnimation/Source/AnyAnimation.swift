//
//  AnyAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public final class AnyAnimation: Animation {
    public var animation: CAAnimation {
        return _animation.animation
    }
    public var key: String {
        return _animation.key
    }

    let _animation: Animation

    init(_ animation: Animation) {
        self._animation = animation
    }

    public func animationAs<T: Animation>(_ type: T) -> T? {
        return _animation as? T
    }
}
