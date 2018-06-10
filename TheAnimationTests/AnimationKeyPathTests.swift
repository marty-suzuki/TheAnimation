
//
//  AnimationKeyPathTests.swift
//  TheAnimationTests
//
//  Created by marty-suzuki on 2018/06/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import XCTest

@testable import TheAnimation

class AnimationKeyPathTests: XCTestCase {

    private func equals<T: AnimationValueType, U: CALayer>(_ keyPath: AnimationKeyPath<T, U>, _ rawValue: String) {
        XCTAssertEqual(keyPath.rawValue, rawValue)
    }

    func testAnchorPoint() {
        equals(.anchorPoint, #keyPath(CALayer.anchorPoint))
        equals(.anchorPointX, #keyPath(CALayer.anchorPoint) + ".x")
        equals(.anchorPointY, #keyPath(CALayer.anchorPoint) + ".y")
    }
}
