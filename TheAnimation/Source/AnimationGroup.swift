//
//  AnimationGroup.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public final class AnimationGroup<LayerType: CALayer>: Animation {
    public let key: String
    public let layer: CALayer

    public var animation: CAAnimation {
        return _animation
    }

    public var animations: [Animation] {
        set {
            keysAndLayers = newValue.map { ($0.key, $0.layer) }
            _animation.animations = newValue.map { $0.animation }
        }
        get {
            guard let animations = _animation.animations else {
                return []
            }
            return animations.enumerated().map { offset, element in
                let (key, layer) = keysAndLayers[offset]
                return AnyAnimation(animation: element, key: key, layer: layer)
            }
        }
    }

    private var keysAndLayers: [(String, CALayer)] = []

    let _animation: CAAnimationGroup

    public init(layer: LayerType) {
        self._animation = CAAnimationGroup()
        self.key = "group"
        self.layer = layer
    }

    public func add<T: Animation>(_ animation: T) {
        animations.append(animation)
    }
}
