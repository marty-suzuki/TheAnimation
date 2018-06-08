//
//  PrimitiveAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public final class PrimitiveAnimation<RawAnimation: CAPropertyAnimation, ValueType: AnimationValueType, LayerType: CALayer>: Animation {
    public var animation: CAAnimation {
        return _animation
    }

    public let key: String
    public let layer: CALayer

    let _animation: RawAnimation

    public var keyPath: AnimationKeyPath<ValueType, LayerType>? {
        set { _animation.keyPath = newValue?.rawValue }
        get { return _animation.keyPath.map { AnimationKeyPath(keyPath: $0) } }
    }

    public init(keyPath: AnimationKeyPath<ValueType, LayerType>, layer: LayerType) {
        self._animation = RawAnimation(keyPath: keyPath.rawValue)
        self.key = keyPath.rawValue
        self.layer = layer
    }
}
