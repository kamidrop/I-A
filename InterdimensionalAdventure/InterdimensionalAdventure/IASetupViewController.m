//
//  IASetupViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/24.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IASetupViewController.h"
#import "IAbottomView.h"
#import "IAtopView.h"
@interface IASetupViewController ()

@end

@implementation IASetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self shiper];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    for(UIView*subview in self.view.window.subviews)
    {
        if ([subview isKindOfClass:[IAbottomView class]]) {
            subview.hidden=YES;
        }
        if ([subview isKindOfClass:[IAtopView class]]) {
            subview.hidden=YES;
        }
    }
    
}
-(void)shiper
{
    _backimage.frame=[UIScreen mainScreen].bounds;
    _music.frame=CGRectMake((16.f/375.f)*[UIScreen mainScreen].bounds.size.width, (104.f/667.f)*[UIScreen mainScreen].bounds.size.height, (88.f/375.f)*[UIScreen mainScreen].bounds.size.width, (88.f/375.f)*[UIScreen mainScreen].bounds.size.width);
    _sound.frame=CGRectMake((16.f/375.f)*[UIScreen mainScreen].bounds.size.width, (269.f/667.f)*[UIScreen mainScreen].bounds.size.height, (88.f/375.f)*[UIScreen mainScreen].bounds.size.width, (88.f/375.f)*[UIScreen mainScreen].bounds.size.width);
    _gameout.frame=CGRectMake((16.f/375.f)*[UIScreen mainScreen].bounds.size.width, (454.f/667.f)*[UIScreen mainScreen].bounds.size.height, (340.f/375.f)*[UIScreen mainScreen].bounds.size.width, (70.f/375.f)*[UIScreen mainScreen].bounds.size.width);
    _back.frame=CGRectMake((16.f/375.f)*[UIScreen mainScreen].bounds.size.width, (561.f/667.f)*[UIScreen mainScreen].bounds.size.height, (340.f/375.f)*[UIScreen mainScreen].bounds.size.width, (70.f/375.f)*[UIScreen mainScreen].bounds.size.width);
//    _particularimage.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-100.f/375.f*[UIScreen mainScreen].bounds.size.width)/2, _backimage.top, 100.f/375.f*[UIScreen mainScreen].bounds.size.width, _backimage.height);
    

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    for(UIView*subview in self.view.window.subviews)
    {
        if ([subview isKindOfClass:[IAbottomView class]]) {
            subview.hidden=NO;
        }
        if ([subview isKindOfClass:[IAtopView class]]) {
            subview.hidden=NO;
        }
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
