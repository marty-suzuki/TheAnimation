//
//  KeyframeAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import CoreGraphics

public typealias KeyframeAnimation<ValueType: AnimationValueType> = PrimitiveAnimation<CAKeyframeAnimation, ValueType>

extension PrimitiveAnimation where RawAnimation == CAKeyframeAnimation {
    public var values: [ValueType] {
        set { _animation.values = newValue }
        get { return _animation.values?.compactMap { $0 as? ValueType } ?? [] }
    }

    public var path: CGPath? {
        set { _animation.path = newValue }
        get { return _animation.path }
    }

    public var keyTimes: [TimeInterval] {
        set { _animation.keyTimes = newValue.map(NSNumber.init) }
        get { return _animation.keyTimes?.map { $0.doubleValue } ?? [] }
    }

    public var timingFunctions: [TimingFunction] {
        set { _animation.timingFunctions = newValue.map { $0.rawValue } }
        get { return _animation.timingFunctions?.compactMap(TimingFunction.init) ?? [] }
    }

    public var calculationMode: CalculationMode {
        set { _animation.calculationMode = newValue.rawValue }
        get { return CalculationMode(rawValue: _animation.calculationMode) }
    }

    public var tensionValues: [CGFloat] {
        set { _animation.tensionValues = newValue.map { NSNumber(value: Double($0)) } }
        get { return _animation.tensionValues?.map { CGFloat($0.doubleValue) } ?? [] }
    }

    public var continuityValues: [CGFloat] {
        set { _animation.continuityValues = newValue.map { NSNumber(value: Double($0)) } }
        get { return _animation.continuityValues?.map { CGFloat($0.doubleValue) } ?? [] }
    }

    public var biasValues: [CGFloat] {
        set { _animation.biasValues = newValue.map { NSNumber(value: Double($0)) } }
        get { return _animation.biasValues?.map { CGFloat($0.doubleValue) } ?? [] }
    }

    public var rotationMode: RotationMode? {
        set { _animation.rotationMode = newValue?.rawValue }
        get { return _animation.rotationMode.map(RotationMode.init) }
    }
}


public struct CalculationMode {
    static let linear     = CalculationMode(rawValue: kCAAnimationLinear)
    static let discrete   = CalculationMode(rawValue: kCAAnimationDiscrete)
    static let paced      = CalculationMode(rawValue: kCAAnimationPaced)
    static let cubic      = CalculationMode(rawValue: kCAAnimationCubic)
    static let cubicPaced = CalculationMode(rawValue: kCAAnimationCubicPaced)

    let rawValue: String
}

public struct RotationMode {
    static let auto          = RotationMode(rawValue: kCAAnimationRotateAuto)
    static let autoaReverse  = RotationMode(rawValue: kCAAnimationRotateAutoReverse)

    let rawValue: String
}
