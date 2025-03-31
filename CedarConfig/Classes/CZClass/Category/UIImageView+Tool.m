//
//  UIImageView+Tool.m
//  JadeShop
//
//  Created by mac on 2019/4/4.
//  Copyright © 2019年 SZJ.test. All rights reserved.
//

#import "UIImageView+Tool.h"
#import "LCAPI.h"
#import "UIImageView+WebCache.h"
#import <SDWebImage/SDWebImageDownloader.h>
static NSString *_cc_urlStr;

@implementation UIImageView (Tool)

UIImage *HRB_IMG(NSString * img){
    return [UIImage imageNamed:img];
}
-(void)hrb_img:(NSString *)name p:(NSString *)p{
    if (name.length == 0) {
        self.image = [UIImage imageNamed:p];
        return;
    }
    UIImage *image = [UIImage imageNamed:name];
    if (!image) {
        [self sd_setImageWithURL:[NSURL URLWithString:name] placeholderImage:[UIImage imageNamed:p]];
    }else{
        self.image = image;
    }
}

-(void)hrb_img:(NSString *)name{
    if ([name isKindOfClass:UIImage.class]) {
        self.image = (UIImage *)name;
        return;
    }
    if (name.length == 0) {
        self.image = [UIImage imageNamed:@"placeholder"];
        return;
    }
    UIImage *image = [UIImage imageNamed:name];
    if (!image) {
        [self sd_setImageWithURL:[NSURL URLWithString:name] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }else{
        self.image = image;
    }
}
-(void)hrb_head:(NSString *)name{
    if (name.length == 0) {
        self.image = [UIImage imageNamed:@"head_placeHolder"];
        return;
    }
    UIImage *image = [UIImage imageNamed:name];
    if (!image) {
        
        [self sd_setImageWithURL:[NSURL URLWithString:name] placeholderImage:[UIImage imageNamed:@"head_placeHolder"]];
       
    }else{
        self.image = image;
    }
}
@end
