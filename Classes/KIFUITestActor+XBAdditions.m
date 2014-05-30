//
//  KIFUITestActor+XBAdditions.m
//  KIF+XBAdditions
//
//  Created by Simone Civetta on 30/05/14.
//

#import "KIFUITestActor+XBAdditions.h"
#import "UIView-KIFAdditions.h"
#import "UIApplication-KIFAdditions.h"
#import "UIAccessibilityElement-KIFAdditions.h"

@implementation KIFUITestActor (XBAdditions)

#pragma mark - Hints

- (UIView *)waitForViewWithAccessibilityHint:(NSString *)hint
{
    UIView *view;
    [self waitForAccessibilityElement:NULL view:&view withHint:hint tappable:NO];
    return view;
}

- (void)waitForAccessibilityElement:(out UIAccessibilityElement **)foundElement view:(out UIView **)foundView withHint:(NSString *)hint tappable:(BOOL)mustBeTappable
{
    __block UIView *view;
    __block UIAccessibilityElement *element;
    
    [self runBlock:^KIFTestStepResult(NSError *__autoreleasing *error) {
        
        element = [[UIApplication sharedApplication] accessibilityElementMatchingBlock:^BOOL(UIAccessibilityElement *el) {
            return [el.accessibilityHint isEqualToString:hint];
        }];
        
        KIFTestWaitCondition(element, error, @"Could not find element with hint: %@", hint);
        
        view = [UIAccessibilityElement viewContainingAccessibilityElement:element tappable:mustBeTappable error:error];
        return view ? KIFTestStepResultSuccess : KIFTestStepResultWait;
    }];
    
    if (foundView) *foundView = view;
    if (foundElement) *foundElement = element;
}

- (void)tapViewWithAccessibilityHint:(NSString *)hint
{
    UIAccessibilityElement *element;
    UIView *view;
    [self waitForAccessibilityElement:&element view:&view withHint:hint tappable:YES];
    [self tapAccessibilityElement:element inView:view];
}

@end
