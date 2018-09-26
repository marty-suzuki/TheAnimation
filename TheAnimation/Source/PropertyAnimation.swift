//
//  PropertyAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

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

    #if swift(>=4.2)
    typealias RawValue = CAValueFunctionName
    public static let rotateX    = ValueFunction(name: .rotateX)
    public static let rotateY    = ValueFunction(name: .rotateY)
    public static let rotateZ    = ValueFunction(name: .rotateZ)
    public static let scale      = ValueFunction(name: .scale)
    public static let scaleX     = ValueFunction(name: .scaleX)
    public static let scaleY     = ValueFunction(name: .scaleY)
    public static let scaleZ     = ValueFunction(name: .scaleZ)
    public static let translate  = ValueFunction(name: .translate)
    public static let translateX = ValueFunction(name: .translateX)
    public static let translateY = ValueFunction(name: .translateY)
    public static let translateZ = ValueFunction(name: .translateZ)
    #else
    typealias RawValue = String
    public static let rotateX    = ValueFunction(name: kCAValueFunctionRotateX)
    public static let rotateY    = ValueFunction(name: kCAValueFunctionRotateY)
    public static let rotateZ    = ValueFunction(name: kCAValueFunctionRotateZ)
    public static let scale      = ValueFunction(name: kCAValueFunctionScale)
    public static let scaleX     = ValueFunction(name: kCAValueFunctionScaleX)
    public static let scaleY     = ValueFunction(name: kCAValueFunctionScaleY)
    public static let scaleZ     = ValueFunction(name: kCAValueFunctionScaleZ)
    public static let translate  = ValueFunction(name: kCAValueFunctionTranslate)
    public static let translateX = ValueFunction(name: kCAValueFunctionTranslateX)
    public static let translateY = ValueFunction(name: kCAValueFunctionTranslateY)
    public static let translateZ = ValueFunction(name: kCAValueFunctionTranslateZ)
    #endif

    let rawValue: CAValueFunction?

    init(name: RawValue) {
        self.rawValue = CAValueFunction(name: name)
    }

    init(_ rawValue: CAValueFunction) {
        self.rawValue = rawValue
    }
}
