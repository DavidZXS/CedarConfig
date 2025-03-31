//
//  UIViewController+Tool.m
//  OhEastMakeWant_Shop
//
//  Created by mac on 2019/12/11.
//  Copyright © 2019 SZJ. All rights reserved.
//

#import "UIViewController+Tool.h"




@implementation UIViewController (Tool)

- (void)p:(UIViewController *)vc{
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)alert:(UIViewController *)vc{
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.definesPresentationContext = YES;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)alertWithoutAnimal:(UIViewController *)vc{
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.definesPresentationContext = YES;
    [self presentViewController:vc animated:NO completion:nil];
}
@end
