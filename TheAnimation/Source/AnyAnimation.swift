//
//  AnyAnimation.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public final class AnyAnimation: Animation {
    public let animation: CAAnimation
    public let key: String

    init(animation: CAAnimation, key: String) {
        self.animation = animation
        self.key = key
    }
}
