//
//  headerViewContrller.m
//  code小品
//
//  Created by flk on 16/9/23.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "headerViewContrller.h"


@interface headerViewContrller ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableview;
}
@end

@implementation headerViewContrller
-(void)viewDidLoad{
    [super viewDidLoad];
    _tableview.frame = self.view.frame;
    _tableview.backgroundColor = [UIColor blackColor];
    _tableview.contentInset  = UIEdgeInsetsMake(-200, 0, 0, 0);

}
-(void)loadView{
    [super loadView];
    _tableview = [[UITableView alloc]init];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
    UIImageView *headerV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"seaGirl.jpg"]];
    _tableview.tableHeaderView = headerV;


}
#pragma mark - tableviewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
cell.textLabel.text = @"nihao";
    return cell;
}
@end
