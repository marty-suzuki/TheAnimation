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
            let animations = newValue.map(AnyAnimation.init)
            _animations = animations
            _animation.animations = animations.map { $0.animation }
        }
        get {
            return _animations
        }
    }

    private var _animations: [AnyAnimation] = []
    private let _animation: CAAnimationGroup

    public init() {
        self._animation = CAAnimationGroup()
        self.key = "group"
    }
}
