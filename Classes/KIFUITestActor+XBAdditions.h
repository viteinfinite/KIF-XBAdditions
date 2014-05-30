//
//  KIFUITestActor+XBAdditions.h
//  KIF+XBAdditions
//
//  Created by Simone Civetta on 30/05/14.
//

#import "KIFUITestActor.h"

/**
 *  A category on KIFUITestActor adding the capability for searching views having a specific accessibility hint.
 */
@interface KIFUITestActor (XBAdditions)

/**
 @abstract Waits until a view or accessibility element is present.
 @discussion The view or accessibility element with the given hint is found in the view hierarchy. If the element isn't found, then the step will attempt to wait until it is. Note that the view does not necessarily have to be visible on the screen, and may be behind another view or offscreen. Views with their hidden property set to YES are ignored.
 
 @param hint The accessibility hint of the element to wait for.
 */
- (UIView *)waitForViewWithAccessibilityHint:(NSString *)hint;

/**
 @abstract Waits for an accessibility element and its containing view based on a variety of criteria.
 @discussion This method provides a more verbose API for achieving what is available in the waitForView family of methods, exposing both the found element and its containing view.  The results can be used in other methods such as @c tapAccessibilityElement:inView:
 @param element To be populated with the matching accessibility element when found.  Can be NULL.
 @param view To be populated with the matching view when found.  Can be NULL.
 @param hint The accessibility hint of the element to wait for.
 @param mustBeTappable If YES, only an element that can be tapped on will be returned.
 */
- (void)waitForAccessibilityElement:(out UIAccessibilityElement **)foundElement view:(out UIView **)foundView withHint:(NSString *)hint tappable:(BOOL)mustBeTappable;

/**
 @abstract Taps a particular view in the view hierarchy.
 @discussion The view or accessibility element with the given hint is searched for in the view hierarchy. If the element isn't found or isn't currently tappable, then the step will attempt to wait until it is. Once the view is present and tappable, a tap event is simulated in the center of the view or element.
 @param hint The accessibility hint of the element to tap.
 */
- (void)tapViewWithAccessibilityHint:(NSString *)hint;

@end
