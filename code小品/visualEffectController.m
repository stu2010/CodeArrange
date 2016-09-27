//
//  visualEffectController.m
//  code小品
//
//  Created by flk on 16/9/20.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "visualEffectController.h"

@interface visualEffectController ()
{
    UIVisualEffectView *_visualView;
    UIImageView *_imageV;
}
@end

@implementation visualEffectController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"毛玻璃";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 280,400)];
    _imageV.image = [UIImage imageNamed: @"taile.jpg"];
    [self.view addSubview:_imageV];
    
    [self iOS8blurAction];
    
}
//毛玻璃模糊效果
- (void)iOS8blurAction{
    
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    _visualView = [[UIVisualEffectView alloc]initWithEffect:beffect];
    _visualView.frame = CGRectMake(50, 100, 280, 400);
    [self.view addSubview:_visualView];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:2.0 animations:^{
        _visualView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [_visualView removeFromSuperview];
        
    }];
    
}
@end
