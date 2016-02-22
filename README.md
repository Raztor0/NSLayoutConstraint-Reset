# NSLayoutConstraint+Reset

[![Build Status](https://travis-ci.org/Raztor0/NSLayoutConstraint-Reset.svg?branch=master)](https://travis-ci.org/Raztor0/NSLayoutConstraint-Reset)
[![Version](https://img.shields.io/cocoapods/v/NSLayoutConstraint+Reset.svg?style=flat)](http://cocoapods.org/pods/NSLayoutConstraint+Reset)
[![License](https://img.shields.io/cocoapods/l/NSLayoutConstraint+Reset.svg?style=flat)](http://cocoapods.org/pods/NSLayoutConstraint+Reset)
[![Platform](https://img.shields.io/cocoapods/p/NSLayoutConstraint+Reset.svg?style=flat)](http://cocoapods.org/pods/NSLayoutConstraint+Reset)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objc
self.myConstraint = [NSLayoutConstraint ...]; // Initialize your constraint (Also works with interface builder)
// We'll assume myConstraint.constant is initialized to 20.0f for this example

self.myConstraint.constant = 50.0f; // Update the constant value

[self.myConstraint reset]; // myConstraint.constant will now be set to 20.0f
```

## Installation

NSLayoutConstraint-Reset is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NSLayoutConstraint+Reset"
```

## Author

Razvan Bangu, razvan.bangu@gmail.com

## License

NSLayoutConstraint+Reset is available under the MIT license. See the LICENSE file for more info.
