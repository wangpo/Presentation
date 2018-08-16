//
//  TNPresentingViewController.m
//  WPDevelopProject
//
//  Created by wangpo on 2018/3/29.
//  Copyright © 2018年 BaoFeng. All rights reserved.
//  弹出视图

#import "TNPresentingViewController.h"
#import "TNPresentedViewController.h"
#import "TNPresentationController.h"

@interface TNPresentingViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation TNPresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"弹出视图";
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(15, 100, 100, 100);
    [button setTitle:@"弹出视图" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(UIButton *)sender
{
    TNPresentedViewController *presentedVC = [[TNPresentedViewController alloc] init];
    presentedVC.modalPresentationStyle = UIModalPresentationCustom;
    presentedVC.transitioningDelegate = self;
    [self presentViewController:presentedVC animated:YES completion:^{
        
    }];
}
#pragma mark - UIViewControllerTransitioningDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[TNPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
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
