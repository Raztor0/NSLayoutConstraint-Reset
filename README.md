# NSLayoutConstraint+Reset

[![Build Status](https://travis-ci.org/Raztor0/NSLayoutConstraint-Reset.svg?branch=master)](https://travis-ci.org/Raztor0/NSLayoutConstraint-Reset)
[![Version](https://img.shields.io/cocoapods/v/NSLayoutConstraint+Reset.svg?style=flat)](http://cocoapods.org/pods/NSLayoutConstraint+Reset)
[![License](https://img.shields.io/cocoapods/l/NSLayoutConstraint+Reset.svg?style=flat)](http://cocoapods.org/pods/NSLayoutConstraint+Reset)
[![Platform](https://img.shields.io/cocoapods/p/NSLayoutConstraint+Reset.svg?style=flat)](http://cocoapods.org/pods/NSLayoutConstraint+Reset)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objc
UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
UIView *constrainedView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
[container addSubview:constrainedView];

NSLayoutConstraint *myConstraint = [NSLayoutConstraint constraintWithItem:constrainedView
attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:container attribute:NSLayoutAttributeTop
multiplier:1.0f constant:20.0f]; // Also works with NSLayoutConstraints created via InterfaceBuilder

NSLog(@"%f", myConstraint.constant); // 20.0
myConstraint.constant = 35.0f;
NSLog(@"%f", myConstraint.constant); // 35.0
[myConstraint reset];
NSLog(@"%f", myConstraint.constant); // 20.0
```

## Installation

NSLayoutConstraint+Reset is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NSLayoutConstraint+Reset"
```

## Author

Razvan Bangu, razvan.bangu@gmail.com

## License

NSLayoutConstraint+Reset is available under the MIT license. See the LICENSE file for more info.
