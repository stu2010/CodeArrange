//
//  masonryTestController.m
//  code小品
//
//  Created by flk on 16/9/22.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "masonryTestController.h"
#import "Masonry.h"

@interface masonryTestController ()
{
    UIView *_view1;
    UIView *_view2;
    UIView *_view3;
    UIView *_view4;
    UIView *_view5;
}
@end
@implementation masonryTestController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UILabel * label = [[UILabel alloc]init];
//    label.backgroundColor = [UIColor redColor];
//    [self.view addSubview:label];
//    
//    //新增约束
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.height.equalTo(@50);
//        make.width.equalTo(@50);
//    }];
//    
//    //更新约束
//    [label mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@100);
//        make.width.equalTo(@100);
//    }];
//    
//    //重设约束
//    [label mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(10);
//        make.top.equalTo(self.view.mas_top).offset(100);
//        make.height.equalTo(@100);
//        make.width.equalTo(@100);
//    }];
    
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.equalTo(@200);
    }];
    
    
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view1.mas_top).offset(10);
        make.left.equalTo(_view1.mas_left).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view2.mas_right).offset(10);
        make.top.equalTo(_view1.mas_top).offset(10);
        make.right.equalTo(_view1.mas_right).offset(-10);
        make.bottom.equalTo(_view1.mas_bottom).offset(-10);
    }];
    
    
    
    

}


-(void)loadView{
    [super loadView];
    
    _view1 = [[UIView alloc]init];
    _view2 = [[UIView alloc]init];
    _view3 = [[UIView alloc]init];
    _view4 = [[UIView alloc]init];
    _view5 = [[UIView alloc]init];
    
    _view1.backgroundColor = [UIColor orangeColor];
    _view2.backgroundColor = [UIColor redColor];
    _view3.backgroundColor = [UIColor purpleColor];
    _view4.backgroundColor = [UIColor cyanColor];
    _view5.backgroundColor = [UIColor blueColor];
    

    [self.view addSubview:_view1];
    [_view1 addSubview:_view2];
    [_view1 addSubview:_view3];
    [_view3 addSubview:_view4];
     [_view3 addSubview:_view5];

    
}
@end
