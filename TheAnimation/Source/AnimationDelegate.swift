//
//  AnimationDelegate.swift
//  TheAnimation-iOS
//
//  Created by marty-suzuki on 2018/12/07.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation

public protocol AnimationDelegate: AnyObject {
    func animationDidStart(_ animation: AnyAnimation)
    func animationDidStop(_ animation: AnyAnimation, finished flag: Bool)
}

extension AnimationDelegate {
    public func animationDidStart(_ animation: AnyAnimation) {}
    public func animationDidStop(_ animation: AnyAnimation, finished flag: Bool) {}
}

final class CAAnimationDelegateProxy: NSObject, CAAnimationDelegate {

    var handler: ((AnimationStatus) -> Void)?

    func animationDidStart(_ anim: CAAnimation) {
        handler?(.didStart)
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        handler?(.didStop(finished: flag))
    }
}
