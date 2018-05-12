//
//  PropertyAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import CoreGraphics

public typealias PropertyAnimation<ValueType: AnimationValueType> = PrimitiveAnimation<CAPropertyAnimation, ValueType>

extension PrimitiveAnimation where RawAnimation: CAPropertyAnimation {
    public var isAdditive: Bool {
        set { _animation.isAdditive = newValue }
        get { return _animation.isAdditive }
    }

    public var isCumulative: Bool {
        set { _animation.isCumulative = newValue }
        get { return _animation.isCumulative }
    }

    public var valueFunction: ValueFunction? {
        set { _animation.valueFunction = newValue.flatMap { $0.rawValue } }
        get { return _animation.valueFunction.flatMap(ValueFunction.init) }
    }
}

public struct ValueFunction {
    static let rotateX    = ValueFunction(name: kCAValueFunctionRotateX)
    static let rotateY    = ValueFunction(name: kCAValueFunctionRotateY)
    static let rotateZ    = ValueFunction(name: kCAValueFunctionRotateZ)
    static let scale      = ValueFunction(name: kCAValueFunctionScale)
    static let scaleX     = ValueFunction(name: kCAValueFunctionScaleX)
    static let scaleY     = ValueFunction(name: kCAValueFunctionScaleY)
    static let scaleZ     = ValueFunction(name: kCAValueFunctionScaleZ)
    static let translate  = ValueFunction(name: kCAValueFunctionTranslate)
    static let translateX = ValueFunction(name: kCAValueFunctionTranslateX)
    static let translateY = ValueFunction(name: kCAValueFunctionTranslateY)
    static let translateZ = ValueFunction(name: kCAValueFunctionTranslateZ)

    let rawValue: CAValueFunction?

    init(name: String) {
        self.rawValue = CAValueFunction(name: name)
    }

    init(_ rawValue: CAValueFunction) {
        self.rawValue = rawValue
    }
}
