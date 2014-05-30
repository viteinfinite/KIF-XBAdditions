# KIF+XBAdditions

[![Version](https://img.shields.io/cocoapods/v/KIF+XBAdditions.svg?style=flat)](http://cocoadocs.org/docsets/KIF+XBAdditions)
[![License](https://img.shields.io/cocoapods/l/KIF+XBAdditions.svg?style=flat)](http://cocoadocs.org/docsets/KIF+XBAdditions)
[![Platform](https://img.shields.io/cocoapods/p/KIF+XBAdditions.svg?style=flat)](http://cocoadocs.org/docsets/KIF+XBAdditions)

## Features

KIF+XBAdditions adds a bunch of useful methods for retrieving views using the accessibility hint property.

You can now use the following methods.

### KIFUITestActor

#### Retrieving a view

	- (UIView *)waitForViewWithAccessibilityHint:(NSString *)hint;
or

	- (void)waitForAccessibilityElement:(out UIAccessibilityElement **)foundElement view:(out UIView **)foundView withHint:(NSString *)hint tappable:(BOOL)mustBeTappable;

#### Tapping on a view

	- (void)tapViewWithAccessibilityHint:(NSString *)hint;

### UIView

#### Retrieving a subview
	- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint;
or

	- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint traits:(UIAccessibilityTraits)traits;
or

	- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint accessibilityValue:(NSString *)value traits:(UIAccessibilityTraits)traits;


## Installation

KIF+XBAdditions is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "KIF+XBAdditions"

## Author

Simone Civetta, Xebia IT Architects, [@viteinfinite](http://twitter.com/viteinfinite)

## License

KIF+XBAdditions is available under the MIT license. See the LICENSE file for more info.

