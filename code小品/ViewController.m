//
//  ViewController.m
//  code小品
//
//  Created by flk on 16/9/20.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "ViewController.h"
#import "visualEffectController.h"
#import "savePicture2AlbumController.h"
#import "masonryTestController.h"
#import "headerViewContrller.h"
#import "encryptionController.h"
#import "searchViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小品";

    _tableview = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    [self.view addSubview:_tableview];
}

#pragma mark - tableviewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString *str = @"跳转控制器";
    if (indexPath.row == 0) {
        str = @"UIVisualEffectView 毛玻璃效果";
    }else if (indexPath.row == 1){
        str = @"截图＋图片保存到相册";
    }else if (indexPath.row == 2){
        str = @"自动布局 wraps autolayout Masonry";
    }else if (indexPath.row == 3){
        str = @"headerview + ";
    }else if (indexPath.row == 4){
        str = @"几种加密方法";
    }else if (indexPath.row == 5){
        str = @"searchViewController 使用";
    }
    cell.textLabel.text = str;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc;
    
    if (indexPath.row == 0) {
        vc = [[visualEffectController alloc]init];
    }else if (indexPath.row == 1){
        vc = [[savePicture2AlbumController alloc]init];
    }else if (indexPath.row == 2){
        vc = [[masonryTestController alloc]init];
    }else if (indexPath.row == 3){
        vc = [[headerViewContrller alloc]init];
    }else if (indexPath.row == 4){
        vc = [[encryptionController alloc]init];
    }else if (indexPath.row == 5){
        vc = [[searchViewController alloc]init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}
@end
