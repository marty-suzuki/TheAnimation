//
//  AnimationGroup.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public final class AnimationGroup: Animation {
    public let key: String

    public var animation: CAAnimation {
        return _animation
    }

    public var animations: [Animation] {
        set {
            keys = newValue.map { $0.key }
            _animation.animations = newValue.map { $0.animation }
        }
        get {
            guard let animations = _animation.animations else {
                return []
            }
            return animations.enumerated().map { offset, element in
                AnyAnimation(animation: element, key: keys[offset])
            }
        }
    }

    private var keys: [String] = []

    let _animation: CAAnimationGroup

    public init() {
        self._animation = CAAnimationGroup()
        self.key = "group"
    }
}
