# TheAnimation

<p align="center">
  <img src="http://img.shields.io/badge/platform-iOS | tvOS | macOS-blue.svg?style=flat" alt="Platform" />
  <a href="https://developer.apple.com/swift">
    <img src="http://img.shields.io/badge/Swift-4.1%20|%204.2-brightgreen.svg?style=flat" alt="Language">
  </a>
  <a href="https://github.com/Carthage/Carthage">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage">
  </a>
  <a href="https://cocoapods.org/pods/TheAnimation">
    <img src="https://img.shields.io/cocoapods/v/TheAnimation.svg?style=flat" alt="Version">
  </a>
  <a href="https://cocoapods.org/pods/TheAnimation">
    <img src="https://img.shields.io/cocoapods/l/TheAnimation.svg?style=flat" alt="License">
  </a>
  <a href="https://travis-ci.org/marty-suzuki/TheAnimation">
    <img src="https://img.shields.io/travis/marty-suzuki/TheAnimation.svg?style=flat" alt="CI Status">
  </a>
</p>

TheAnimation is Type-safe CAAnimation wrapper.

![](./Images/basic_animation.png)

## Introduction

For example, if you want to animate `backgroundColor` with `CABasicAnimation`, you need to consider type because fromValue property and so on are `Any?`.

![](./Images/background_raw.png)

If you use `BasicAnimation of TheAnimation`, you can animate `backgroundColor` without considering type! (`AnimationKeyPaths.backgroundColor` is `AnimationKeyPath<CGColor>` type.)

![](./Images/background.png)

## Usage

The way of making an animation is almost similar `CAAnimation`.
But you need to use `animation.animate(in:)` method instead of using `layer.add(_:forKey:)`.

```swift
let view = UIView()

let animation = BasicAnimation(keyPath: .opacity)
animation.fromValue = 0
animation.toValue   = 1
animation.duration  = 1
animation.animate(in: view)
```

`animation.animate(in:)` returns `AnimaitonCanceller`. You can cancel an animation with it.

```swift
let canceller = animation.animate(in: view)
canceller.cancelAnimation()
```

## Example

To run the example project, clone the repo, and open Example directory.

## Correspondence Table

| CAAnimation | TheAnimation |
| :-: | :-: |
| CAPropertyAnimation | PropertyAnimation |
| CABasicAnimation | BasicAnimation |
| CAKeyframeAnimation | KeyframeAnimation |
| CASpringAnimation | SpringAnimation |
| CATransition | TransitionAnimation |
| CAAnimationGroup | AnimationGroup |

## Add new `AnimationKeyPath`

You can add `AnimationKeyPath` like this.

```swift
extension AnimationKeyPaths {
    static let newKeyPath = AnimationKeyPath<CGFloat>(keyPath: "abcd")
}
```

## Requirements

- Xcode 9.3
- iOS 9 or greater
- tvOS 9 or greater
- macOS 10.11 or greater
- Swift 4.2 (since 0.3.0)

## Installation

### Carthage

If you’re using [Carthage](https://github.com/Carthage/Carthage), simply add
TheAnimation to your `Cartfile`:

```ruby
github "marty-suzuki/TheAnimation"
```

### CocoaPods

TheAnimation is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TheAnimation'
```

## Author

marty-suzuki, s1180183@gmail.com

## License

TheAnimation is available under the MIT license. See the LICENSE file for more info.
