//
//  savePicture2AlbumController.m
//  code小品
//
//  Created by flk on 16/9/20.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "savePicture2AlbumController.h"
#import "MBProgressUtils.h"
#import "MBProgressMHD/MBProgressHUD.h"

@interface savePicture2AlbumController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tabelView;
    UIImageView *_imageV;
}
@end
@implementation savePicture2AlbumController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UITableView *tabeVIew = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    tabeVIew.delegate = self;
    tabeVIew.dataSource = self;
    _tabelView = tabeVIew;
    [self.view addSubview:tabeVIew];
    
    
}
// 点击   "保存图片" + "截图"
-(void)saveImageWith:(BOOL)save index:(NSIndexPath *)index{
    
    NSArray *ar = @[index];
    [_tabelView reloadRowsAtIndexPaths:ar withRowAnimation:UITableViewRowAnimationNone];
    
    UIImage *img;
    if (save) {
        img = _imageV.image;
    }else{
        img = [self screenSheet];
    }

    UIImageWriteToSavedPhotosAlbum(img, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    
}

//图片保存至相册
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) {
        [MBProgressUtils showCustomTipWithController:self title:@"保存成功" sucess:YES];
    }else
    {
        [MBProgressUtils showCustomTipWithController:self title:@"保存失败" sucess:NO];
//        message = [error description];
    }
}
    //可编辑cell
-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewRowAction *rowActionSec = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                                title:@"保存图片"    handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                                    [self saveImageWith:YES index:indexPath];
                                                                                    
                                                                                }];
        UITableViewRowAction *rowActionSec1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                                 title:@"截图" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                                     [self saveImageWith:NO index:indexPath];
                                                                                     
                                                                                 }];
        rowActionSec.backgroundColor = [UIColor orangeColor];
        rowActionSec1.backgroundColor = [UIColor blueColor];
    
        NSArray *arr = @[rowActionSec,rowActionSec1];
        return arr;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    cell.textLabel.text=@"测试 test";
    
    if (indexPath.row == 4) {
        _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 250, 80)];
        _imageV.image = [UIImage imageNamed:@"taile.jpg"];
        [cell.contentView addSubview:_imageV];
    }
    return cell;
}
//屏幕截图
-(UIImage *)screenSheet{
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    }

@end
