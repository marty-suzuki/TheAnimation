//
//  AnimationKeyPaths.swift
//  TheAnimation
//
//  Created by marty-suzuki on 2018/05/11.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import QuartzCore.CoreAnimation
import CoreImage

open class AnimationKeyPaths {
    fileprivate init() {}
}

public protocol AnimationValueType {}

public final class AnimationKeyPath<ValueType: AnimationValueType, LayerType: CALayer>: AnimationKeyPaths {
    let rawValue: String

    public init(keyPath: String) {
        self.rawValue = keyPath
    }
}

extension Array:         AnimationValueType {}
extension Bool:          AnimationValueType {}
extension CALayer:       AnimationValueType {}
extension CATransform3D: AnimationValueType {}
extension CGColor:       AnimationValueType {}
extension CGFloat:       AnimationValueType {}
extension CGPath:        AnimationValueType {}
extension CGPoint:       AnimationValueType {}
extension CGRect:        AnimationValueType {}
extension CGSize:        AnimationValueType {}
extension CIFilter:      AnimationValueType {}

extension AnimationKeyPaths {
    public static let anchorPoint       = AnimationKeyPath<CGPoint, CALayer>      (keyPath: #keyPath(CALayer.anchorPoint))
    public static let backgroundColor   = AnimationKeyPath<CGColor, CALayer>      (keyPath: #keyPath(CALayer.backgroundColor))
    public static let borderColor       = AnimationKeyPath<CGColor, CALayer>      (keyPath: #keyPath(CALayer.borderColor))
    public static let borderWidth       = AnimationKeyPath<CGFloat, CALayer>      (keyPath: #keyPath(CALayer.borderWidth))
    public static let bounds            = AnimationKeyPath<CGRect,  CALayer>      (keyPath: #keyPath(CALayer.bounds))
    public static let contents          = AnimationKeyPath<[Any],   CALayer>      (keyPath: #keyPath(CALayer.contents))
    public static let contentsRect      = AnimationKeyPath<CGRect,  CALayer>      (keyPath: #keyPath(CALayer.contentsRect))
    public static let cornerRadius      = AnimationKeyPath<CGFloat, CALayer>      (keyPath: #keyPath(CALayer.cornerRadius))
    public static let filters           = AnimationKeyPath<[CIFilter], CALayer>   (keyPath: #keyPath(CALayer.filters))
    public static let frame             = AnimationKeyPath<CGRect, CALayer>       (keyPath: #keyPath(CALayer.frame))
    public static let hidden            = AnimationKeyPath<Bool, CALayer>         (keyPath: #keyPath(CALayer.isHidden))
    public static let mask              = AnimationKeyPath<CALayer, CALayer>      (keyPath: #keyPath(CALayer.mask))
    public static let masksToBounds     = AnimationKeyPath<Bool, CALayer>         (keyPath: #keyPath(CALayer.masksToBounds))
    public static let opacity           = AnimationKeyPath<CGFloat, CALayer>      (keyPath: #keyPath(CALayer.opacity))
    public static let path              = AnimationKeyPath<CGPath, CAShapeLayer>  (keyPath: #keyPath(CAShapeLayer.path))
    public static let position          = AnimationKeyPath<CGPoint, CALayer>      (keyPath: #keyPath(CALayer.position))
    public static let shadowColor       = AnimationKeyPath<CGColor, CALayer>      (keyPath: #keyPath(CALayer.shadowColor))
    public static let shadowOffset      = AnimationKeyPath<CGSize, CALayer>       (keyPath: #keyPath(CALayer.shadowOffset))
    public static let shadowOpacity     = AnimationKeyPath<CGFloat, CALayer>      (keyPath: #keyPath(CALayer.shadowOpacity))
    public static let shadowPath        = AnimationKeyPath<CGPath, CALayer>       (keyPath: #keyPath(CALayer.shadowPath))
    public static let shadowRadius      = AnimationKeyPath<CGFloat, CALayer>      (keyPath: #keyPath(CALayer.shadowRadius))
    public static let sublayers         = AnimationKeyPath<[CALayer], CALayer>    (keyPath: #keyPath(CALayer.sublayers))
    public static let sublayerTransform = AnimationKeyPath<CATransform3D, CALayer>(keyPath: #keyPath(CALayer.sublayerTransform))
    public static let transform         = AnimationKeyPath<CATransform3D, CALayer>(keyPath: #keyPath(CALayer.transform))
    public static let zPosition         = AnimationKeyPath<CGFloat, CALayer>      (keyPath: #keyPath(CALayer.opacity))
}

extension AnimationKeyPaths {
    public static let anchorPointX = AnimationKeyPath<CGPoint, CALayer>(keyPath: "\(#keyPath(CALayer.anchorPoint)).x")
    public static let anchorPointY = AnimationKeyPath<CGPoint, CALayer>(keyPath: "\(#keyPath(CALayer.anchorPoint)).y")
}

extension AnimationKeyPaths {
    public static let boundsOrigin     = AnimationKeyPath<CGPoint, CALayer>(keyPath: "\(#keyPath(CALayer.bounds)).origin")
    public static let boundsOriginX    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.bounds)).origin.x")
    public static let boundsOriginY    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.bounds)).origin.y")
    public static let boundsSize       = AnimationKeyPath<CGSize, CALayer> (keyPath: "\(#keyPath(CALayer.bounds)).size")
    public static let boundsSizeWidth  = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.bounds)).size.width")
    public static let boundsSizeHeight = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.bounds)).size.height")
}

extension AnimationKeyPaths {
    public static let contentsRectOrigin     = AnimationKeyPath<CGPoint, CALayer>(keyPath: "\(#keyPath(CALayer.contentsRect)).origin")
    public static let contentsRectOriginX    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.contentsRect)).origin.x")
    public static let contentsRectOriginY    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.contentsRect)).origin.y")
    public static let contentsRectSize       = AnimationKeyPath<CGSize, CALayer> (keyPath: "\(#keyPath(CALayer.contentsRect)).size")
    public static let contentsRectSizeWidth  = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.contentsRect)).size.width")
    public static let contentsRectSizeHeight = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.contentsRect)).size.height")
}

extension AnimationKeyPaths {
    public static let frameOrigin     = AnimationKeyPath<CGPoint, CALayer>(keyPath: "\(#keyPath(CALayer.frame)).origin")
    public static let frameOriginX    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.frame)).origin.x")
    public static let frameOriginY    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.frame)).origin.y")
    public static let frameSize       = AnimationKeyPath<CGSize, CALayer> (keyPath: "\(#keyPath(CALayer.frame)).size")
    public static let frameSizeWidth  = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.frame)).size.width")
    public static let frameSizeHeight = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.frame)).size.height")
}

extension AnimationKeyPaths {
    public static let positionX = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.position)).x")
    public static let positionY = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.position)).y")
}

extension AnimationKeyPaths {
    public static let shadowOffsetWidth  = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.shadowOffset)).width")
    public static let shadowOffsetHeight = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.shadowOffset)).height")
}

extension AnimationKeyPaths {
    public static let sublayerTransformRotationX    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).rotation.x")
    public static let sublayerTransformRotationY    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).rotation.y")
    public static let sublayerTransformRotationZ    = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).rotation.z")
    public static let sublayerTransformScaleX       = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).scale.x")
    public static let sublayerTransformScaleY       = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).scale.y")
    public static let sublayerTransformScaleZ       = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).scale.z")
    public static let sublayerTransformTranslationX = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).translation.x")
    public static let sublayerTransformTranslationY = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).translation.y")
    public static let sublayerTransformTranslationZ = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).translation.z")
}

extension AnimationKeyPaths {
    public static let transformRotationX     = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).rotation.x")
    public static let transformRotationY     = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).rotation.y")
    public static let transformRotationZ     = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).rotation.z")
    public static let transformScaleX        = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).scale.x")
    public static let transformScaleY        = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).scale.y")
    public static let transformScaleZ        = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).scale.z")
    public static let transformTranslationX  = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).translation.x")
    public static let transformTranslationY  = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).translation.y")
    public static let transformTranslationZ  = AnimationKeyPath<CGFloat, CALayer>(keyPath: "\(#keyPath(CALayer.transform)).translation.z")
}
