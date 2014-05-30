//
//  KIFUITestActor+XBAdditions.m
//  Annonces du Bateau
//
//  Created by Simone Civetta on 30/05/14.
//  Copyright (c) 2014 Xebia IT Architects. All rights reserved.
//

#import "KIFUITestActor+XBAdditions.h"
#import "UIView-KIFAdditions.h"
#import "UIApplication-KIFAdditions.h"
#import "UIAccessibilityElement-KIFAdditions.h"

@implementation KIFUITestActor (XBAdditions)

- (void)waitForAccessibilityElement:(out UIAccessibilityElement **)foundElement view:(out UIView **)foundView hint:(NSString *)hint
{
    __block UIView *view;
    __block UIAccessibilityElement *element;
    
    [self runBlock:^KIFTestStepResult(NSError *__autoreleasing *error) {
        
        element = [[UIApplication sharedApplication] accessibilityElementMatchingBlock:^BOOL(UIAccessibilityElement *el) {
            return [el.accessibilityHint isEqualToString:hint];
        }];
        
        KIFTestWaitCondition(element, error, @"Could not find element with hint: %@", hint);
        
        view = [UIAccessibilityElement viewContainingAccessibilityElement:element tappable:NO error:error];
        return view ? KIFTestStepResultSuccess : KIFTestStepResultWait;
    }];
    
    if (foundView) *foundView = view;
    if (foundElement) *foundElement = element;
}

- (UIView *)waitForViewWithAccessibilityHint:(NSString *)hint
{
    UIView *view;
    [self waitForAccessibilityElement:NULL view:&view hint:hint];
    return view;
}

- (void)tapViewWithAccessibilityHint:(NSString *)hint
{
    UIAccessibilityElement *element;
    UIView *view;
    [self waitForAccessibilityElement:&element view:&view hint:hint];
    [self tapAccessibilityElement:element inView:view];
}

@end
