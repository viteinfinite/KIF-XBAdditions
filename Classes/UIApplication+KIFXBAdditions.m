//
//  UIApplication+KIFXBAdditions.m
//  Pods
//
//  Created by Simone Civetta on 30/05/14.
//
//

#import "UIApplication+KIFXBAdditions.h"
#import "UIView-KIFAdditions.h"
#import <KIF/UIApplication-KIFAdditions.h>

@implementation UIApplication (KIFXBAdditions)

- (UITableView *)mainTableView
{
    for (UIWindow *window in [self.windowsWithKeyWindow reverseObjectEnumerator]) {
        NSArray *tableViews = [window subviewsWithClassNameOrSuperClassNamePrefix:@"UITableView"];
        if ([tableViews count]) {
            return tableViews[0];
        }
    }
    return nil;
}

@end
