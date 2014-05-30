//
//  UIView+XBAdditions.m
//  Pods
//
//  Created by Simone Civetta on 30/05/14.
//
//

#import "UIView+KIFXBAdditions.h"
#import "UIView-KIFAdditions.h"

@implementation UIView (KIFXBAdditions)


- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint
{
    return [self accessibilityElementWithHint:hint traits:UIAccessibilityTraitNone];
}

- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint traits:(UIAccessibilityTraits)traits;
{
    return [self accessibilityElementWithHint:hint accessibilityValue:nil traits:traits];
}

- (UIAccessibilityElement *)accessibilityElementWithHint:(NSString *)hint accessibilityValue:(NSString *)value traits:(UIAccessibilityTraits)traits;
{
    return [self accessibilityElementMatchingBlock:^(UIAccessibilityElement *element) {
        
        // TODO: This is a temporary fix for an SDK defect.
        NSString *accessibilityValue = nil;
        @try {
            accessibilityValue = element.accessibilityValue;
        }
        @catch (NSException *exception) {
            NSLog(@"KIF: Unable to access accessibilityValue for element %@ because of exception: %@", element, exception.reason);
        }
        
        if ([accessibilityValue isKindOfClass:[NSAttributedString class]]) {
            accessibilityValue = [(NSAttributedString *)accessibilityValue string];
        }
        
        BOOL hintsMatch = element.accessibilityHint == hint || [element.accessibilityHint isEqual:hint];
        BOOL traitsMatch = ((element.accessibilityTraits) & traits) == traits;
        BOOL valuesMatch = !value || [value isEqual:accessibilityValue];
        
        return (BOOL)(hintsMatch && traitsMatch && valuesMatch);
    }];
}

@end
