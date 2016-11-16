//
//  searchViewController.m
//  code小品
//
//  Created by sk on 2016/11/16.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "searchViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#define ColorMacro(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


@interface searchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>
{
    UITableView *_tabView;
    NSMutableArray *_dataarr;
    NSMutableArray *_filterarr;
}
@property(nonatomic,strong) UISearchController *searchController;;

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"test";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setDate];
    
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = false;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.backgroundColor = ColorMacro(0xdc,0xdc,0xdc);
    
    _tabView.tableHeaderView = self.searchController.searchBar;
    _tabView.contentOffset = CGPointMake(0, 44);
    
    
    ////////////// setting
    UIImage* searchBarBg = [self GetImageWithColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:0.8] andHeight:32.0f];
    //设置背景图片
    [self.searchController.searchBar setBackgroundImage:searchBarBg];
    //设置背景色
    [self.searchController.searchBar setBackgroundColor:[UIColor clearColor]];
    //设置文本框背景
//    [self.searchController.searchBar setSearchFieldBackgroundImage:searchBarBg1 forState:UIControlStateNormal];
    
    
    //////字体颜色
    UITextField *searchField = [self.searchController.searchBar valueForKey:@"_searchField"];
    //searchField.textColor = [UIColor orangeColor];
    [searchField setValue:[UIColor orangeColor] forKeyPath:@"_placeholderLabel.textColor"];
    //// 放大镜
    UIImage *image = [UIImage imageNamed:@"cl_tab2_gray"];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:image];
    iconView.frame = CGRectMake(0, 0, image.size.width , image.size.height);
    searchField.leftView = iconView;
    
    self.searchController.searchBar.placeholder = @"搜索";
    
}
-(void)loadView{
    [super loadView];
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];
    
    
}
-(void)setDate{
    _filterarr = [[NSMutableArray alloc]init];
    _dataarr = [[NSMutableArray alloc]init];
    for (int i = 0; i<30; i++) {
        NSString *str = [NSString stringWithFormat:@"%02d-%@",i,@"是个好人"];
        [_dataarr addObject:str];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!self.searchController.active) {
        return 30;
    }
    return _filterarr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!self.searchController.active) {
        cell.textLabel.text = _dataarr[indexPath.row];
        
    }else{
        cell.textLabel.text = _filterarr[indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.searchController.active) {
        ViewController1 *vc = [[ViewController1 alloc]init];
        [self.navigationController pushViewController:vc animated:NO];
    }else{
        ViewController2 *vc = [[ViewController2 alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    [_filterarr removeAllObjects];
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", self.searchController.searchBar.text];
    _filterarr = [[_dataarr filteredArrayUsingPredicate:searchPredicate] mutableCopy];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tabView reloadData];
    });
    
}
- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    if (self.searchController.active) {
        self.searchController.active = NO;
        [self.searchController.searchBar removeFromSuperview];
    }
}

- (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}
@end
