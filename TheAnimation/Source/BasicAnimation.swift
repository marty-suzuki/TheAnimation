//
//  BasicAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public typealias BasicAnimation<ValueType: AnimationValueType> = PrimitiveAnimation<CABasicAnimation, ValueType>

extension PrimitiveAnimation where RawAnimation == CABasicAnimation {
    public var fromValue: ValueType? {
        set { _animation.fromValue = newValue }
        get { return _animation.fromValue as? ValueType }
    }

    public var toValue: ValueType? {
        set { _animation.toValue = newValue }
        get { return _animation.toValue as? ValueType }
    }

    public var byValue: ValueType? {
        set { _animation.byValue = newValue }
        get { return _animation.byValue as? ValueType }
    }
}
