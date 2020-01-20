//
//  CAAnimationDelegateProxy.swift
//  TheAnimation
//
//  Created by 鈴木大貴 on 2020/01/21.
//  Copyright © 2020 marty-suzuki. All rights reserved.
//

import Foundation

final class CAAnimationDelegateProxy: NSObject, CAAnimationDelegate {

    var didStart: ((CAAnimation) -> Void)?
    var didStop: ((CAAnimation, Bool) -> Void)?

    func animationDidStart(_ anim: CAAnimation) {
        didStart?(anim)
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        didStop?(anim, flag)
    }
}

private var delegateProxyAssociatedKey: UInt8 = 0

extension CAAnimation {

    var delegateProxy: CAAnimationDelegateProxy {
        if let delegate = objc_getAssociatedObject(self, &delegateProxyAssociatedKey) as? CAAnimationDelegateProxy {
            return delegate
        } else {
            let delegate = CAAnimationDelegateProxy()
            objc_setAssociatedObject(self, &delegateProxyAssociatedKey, delegate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.delegate = delegate
            return delegate
        }
    }
}
