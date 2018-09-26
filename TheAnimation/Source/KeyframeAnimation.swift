//
//  KeyframeAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public typealias KeyframeAnimation<ValueType: AnimationValueType> = PrimitiveAnimation<CAKeyframeAnimation, ValueType>

extension PrimitiveAnimation where RawAnimation == CAKeyframeAnimation {
    public var values: [ValueType] {
        return _animation.values?.compactMap { $0 as? ValueType } ?? []
    }

    public var path: CGPath? {
        set { _animation.path = newValue }
        get { return _animation.path }
    }

    public var keyTimes: [TimeInterval] {
        return _animation.keyTimes?.map { $0.doubleValue } ?? []
    }

    public var timingFunctions: [TimingFunction] {
        return _animation.timingFunctions?.compactMap(TimingFunction.init) ?? []
    }

    public var calculationMode: CalculationMode {
        set { _animation.calculationMode = newValue.rawValue }
        get { return CalculationMode(rawValue: _animation.calculationMode) }
    }

    public var tensionValues: [CGFloat] {
        return _animation.tensionValues?.map { CGFloat($0.doubleValue) } ?? []
    }

    public var continuityValues: [CGFloat] {
        return _animation.continuityValues?.map { CGFloat($0.doubleValue) } ?? []
    }

    public var biasValues: [CGFloat] {
        return _animation.biasValues?.map { CGFloat($0.doubleValue) } ?? []
    }

    public var rotationMode: RotationMode? {
        set { _animation.rotationMode = newValue?.rawValue }
        get { return _animation.rotationMode.map(RotationMode.init) }
    }

    public func add(value: ValueType,
                    keyTime: TimeInterval,
                    timingFunction: TimingFunction = .default,
                    tensionValue: Double = 0,
                    continuityValue: Double = 0,
                    biasValue: Double = 0) {
        if let values = _animation.values {
            _animation.values = values + [value]
        } else {
            _animation.values = [value]
        }

        if let keyTimes = _animation.keyTimes {
            _animation.keyTimes = keyTimes + [NSNumber(value: keyTime)]
        } else {
            _animation.keyTimes = [NSNumber(value: keyTime)]
        }

        if let timingFunctions = _animation.timingFunctions {
            _animation.timingFunctions = timingFunctions + [timingFunction.rawValue]
        } else {
            _animation.timingFunctions = [timingFunction.rawValue]
        }

        if let tensionValues = _animation.tensionValues {
            _animation.tensionValues = tensionValues + [NSNumber(value: tensionValue)]
        } else {
            _animation.tensionValues = [NSNumber(value: tensionValue)]
        }

        if let continuityValues = _animation.continuityValues {
            _animation.continuityValues = continuityValues + [NSNumber(value: continuityValue)]
        } else {
            _animation.continuityValues = [NSNumber(value: continuityValue)]
        }

        if let biasValues = _animation.biasValues {
            _animation.biasValues = biasValues + [NSNumber(value: biasValue)]
        } else {
            _animation.biasValues = [NSNumber(value: biasValue)]
        }
    }
}


public struct CalculationMode {

    #if swift(>=4.2)
    typealias RawValue = CAAnimationCalculationMode
    public static let linear     = CalculationMode(rawValue: .linear)
    public static let discrete   = CalculationMode(rawValue: .discrete)
    public static let paced      = CalculationMode(rawValue: .paced)
    public static let cubic      = CalculationMode(rawValue: .cubic)
    public static let cubicPaced = CalculationMode(rawValue: .cubicPaced)
    #else
    typealias RawValue = String
    public static let linear     = CalculationMode(rawValue: kCAAnimationLinear)
    public static let discrete   = CalculationMode(rawValue: kCAAnimationDiscrete)
    public static let paced      = CalculationMode(rawValue: kCAAnimationPaced)
    public static let cubic      = CalculationMode(rawValue: kCAAnimationCubic)
    public static let cubicPaced = CalculationMode(rawValue: kCAAnimationCubicPaced)
    #endif

    let rawValue: RawValue
}

public struct RotationMode {

    #if swift(>=4.2)
    typealias RawValue = CAAnimationRotationMode
    public static let auto          = RotationMode(rawValue: .rotateAuto)
    public static let autoaReverse  = RotationMode(rawValue: .rotateAutoReverse)
    #else
    typealias RawValue = String
    public static let auto          = RotationMode(rawValue: kCAAnimationRotateAuto)
    public static let autoaReverse  = RotationMode(rawValue: kCAAnimationRotateAutoReverse)
    #endif

    let rawValue: RawValue
}
