//
//  PrimitiveAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public final class PrimitiveAnimation<RawAnimation: CAPropertyAnimation, ValueType: AnimationValueType>: Animation {
    public var animation: CAAnimation {
        return _animation
    }

    public let key: String

    let _animation: RawAnimation

    public var keyPath: AnimationKeyPath<ValueType>? {
        set { _animation.keyPath = newValue?.rawValue }
        get { return _animation.keyPath.map(AnimationKeyPath.init) }
    }

    public init(keyPath: AnimationKeyPath<ValueType>) {
        self._animation = RawAnimation(keyPath: keyPath.rawValue)
        self.key = keyPath.rawValue
    }
}
