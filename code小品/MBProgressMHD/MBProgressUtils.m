//
//  MBProgressUtils.m
//  code小品
//
//  Created by flk on 16/9/21.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "MBProgressUtils.h"
#import "MBProgressHUD.h"

@implementation MBProgressUtils

//普通提示 //成功//失败//
+(void)showCustomTipWithController:(UIViewController *)viewController title:(NSString *)title sucess:(BOOL)sucess{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewController.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    if (sucess) {
        UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
    }
    hud.square = YES;
//    hud.label.text = NSLocalizedString(title, @"HUD done title");
    hud.label.text = title;
    [hud hideAnimated:YES afterDelay:1.f];

}

@end
