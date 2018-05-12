//
//  TimingFunction.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/12.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import CoreGraphics

public struct TimingFunction {
    public static let `default`     = TimingFunction(name: kCAMediaTimingFunctionDefault)
    public static let linear        = TimingFunction(name: kCAMediaTimingFunctionLinear)
    public static let easeIn        = TimingFunction(name: kCAMediaTimingFunctionEaseIn)
    public static let easeOut       = TimingFunction(name: kCAMediaTimingFunctionEaseOut)
    public static let easeInEaseOut = TimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

    let rawValue: CAMediaTimingFunction

    init(name: String) {
        self.rawValue = CAMediaTimingFunction(name: name)
    }

    init(_ rawValue: CAMediaTimingFunction) {
        self.rawValue = rawValue
    }

    public init(controlPoints c1x: Float, _ c1y: Float, _ c2x: Float, _ c2y: Float) {
        self.rawValue = CAMediaTimingFunction(controlPoints: c1x, c1y, c2x, c2y)
    }
}
