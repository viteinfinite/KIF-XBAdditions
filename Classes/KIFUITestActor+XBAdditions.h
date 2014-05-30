//
//  KIFUITestActor+XBAdditions.h
//  Annonces du Bateau
//
//  Created by Simone Civetta on 30/05/14.
//  Copyright (c) 2014 Xebia IT Architects. All rights reserved.
//

#import "KIFUITestActor.h"

@interface KIFUITestActor (XBAdditions)

- (void)waitForAccessibilityElement:(out UIAccessibilityElement **)foundElement view:(out UIView **)foundView hint:(NSString *)hint;
- (UIView *)waitForViewWithAccessibilityHint:(NSString *)hint;
- (void)tapViewWithAccessibilityHint:(NSString *)hint;

@end
