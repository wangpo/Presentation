//
//  TestViewController.m
//  Presentation
//
//  Created by wangpo on 2018/8/16.
//  Copyright © 2018年 wangpo. All rights reserved.
//

#import "TestViewController.h"
#import "SGElectricAccountSelectorViewController.h"
#import "SGPopoverBackgroundView.h"

@interface TestViewController ()<UIPopoverPresentationControllerDelegate>
@property (nonatomic, strong) UIButton *accountSelectBtn;
@property (nonatomic, strong) UILabel *accountTitleLab;
@property (nonatomic, strong) UIImageView *accountListIndicatorImageView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.accountSelectBtn];
}


- (UIButton *)accountSelectBtn
{
    if (!_accountSelectBtn) {
        _accountSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _accountSelectBtn.frame = CGRectMake(0, 0, 80, 41);
        [_accountSelectBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_accountSelectBtn addSubview:self.accountTitleLab];
        [_accountSelectBtn addSubview:self.accountListIndicatorImageView];
    }
    return _accountSelectBtn;
}

- (void)buttonAction:(UIButton *)sender
{
    SGElectricAccountSelectorViewController *presentedVC = [[SGElectricAccountSelectorViewController alloc] init];
    presentedVC.preferredContentSize = CGSizeMake(125, 125);//设置浮窗的宽高
    presentedVC.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController * popover = [presentedVC popoverPresentationController];
    popover.delegate = self;
    popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popover.sourceView = self.accountSelectBtn;//设置目标视图
    popover.sourceRect = self.accountSelectBtn.bounds;//弹出视图显示位置
    popover.popoverBackgroundViewClass = [SGPopoverBackgroundView class];
    __weak typeof(self) weakSelf = self;
    presentedVC.selectElectricAccountBlock = ^(NSString *account) {
        weakSelf.accountTitleLab.text = account;
    };
    [self presentViewController:presentedVC animated:YES completion:nil];
}

- (UILabel *)accountTitleLab
{
    if (!_accountTitleLab) {
        _accountTitleLab = [[UILabel alloc] init];
        _accountTitleLab.frame = CGRectMake(0, 0, 60, 41);
        _accountTitleLab.text = @"我家";
        _accountTitleLab.textAlignment = NSTextAlignmentRight;
        _accountTitleLab.textColor = [UIColor blackColor];
        _accountTitleLab.font = [UIFont systemFontOfSize:12.0f];
    }
    return _accountTitleLab;
}

- (UIImageView *)accountListIndicatorImageView
{
    if (!_accountListIndicatorImageView) {
        _accountListIndicatorImageView = [[UIImageView alloc] init];
        _accountListIndicatorImageView.frame = CGRectMake(70, 0, 10, 41);
        _accountListIndicatorImageView.image = [UIImage imageNamed:@"region_pull"];
        _accountListIndicatorImageView.contentMode = UIViewContentModeCenter;
    }
    return _accountListIndicatorImageView;
}

#pragma mark - UIPopoverPresentationControllerDelegate
//浮窗弹窗的推出样式
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

//点击浮窗背景popover controller是否消失
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController;
{
    return YES;
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
