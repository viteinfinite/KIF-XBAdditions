//
//  UIView+KIFXBAdditions.h
//  Pods
//
//  Created by Simone Civetta on 30/05/14.
//
//

#import <UIKit/UIKit.h>

/**
 *  A category on UIView adding the capability for searching for accessibility elements having a specific accessibility hint.
 */
@interface UIView (KIFXBAdditions)

/**
 *  Retrieves an accessibility element having a specific hint
 *
 *  @param hint The accessibility hint of the element to retrieve.
 */
- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint;

/**
 *  Retrieves an accessibility element having specific hint and traits
 *
 *  @param hint   The accessibility hint of the element to retrieve.
 *  @param traits The accessibility traits of the element to retrieve.
 */
- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint traits:(UIAccessibilityTraits)traits;

/**
 *  Retrieves an accessibility element having specific hint, value and traits
 *
 *  @param hint   The accessibility hint of the element to retrieve.
 *  @param value  The accessibility value of the element to retrieve.
 *  @param traits The accessibility traits of the element to retrieve.
 */
- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint accessibilityValue:(NSString *)value traits:(UIAccessibilityTraits)traits;

@end
