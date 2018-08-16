//
//  SGElectricAccountSelectorViewController.m
//  SGCC
//
//  Created by wangpo on 2018/6/14.
//  Copyright © 2018年 SGCC. All rights reserved.
//

#import "SGElectricAccountSelectorViewController.h"

@interface SGElectricAccountSelectorViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation SGElectricAccountSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
    self.dataSource = [@[@{@"title":@"我家",@"image":@"home"},@{@"title":@"公司",@"image":@"company"},@{@"title":@"绑定户号",@"image":@"binding"}] mutableCopy];
}

- (void)setupViews
{
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.rowHeight = 40;
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}


#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *info = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [info objectForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:[info objectForKey:@"image"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:NO completion:^{
        if (self.selectElectricAccountBlock) {
            NSDictionary *info = [self.dataSource objectAtIndex:indexPath.row];
            self.selectElectricAccountBlock([info objectForKey:@"title"]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
