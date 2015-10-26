//
//  IAEnterViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAEnterViewController.h"
#import "UIView+Extension.h"
@interface IAEnterViewController ()

@end

@implementation IAEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self shipei];

}
-(void)viewDidAppear:(BOOL)animated
{
    for(UIView*subview in self.view.window.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UITransitionView")]) {
            subview.frame=CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
        }
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)shipei
{

    _god1button.frame=CGRectMake(
                                 [UIScreen mainScreen].bounds.size.width*0.5-100.f/375.f*[UIScreen mainScreen].bounds.size.width*0.5,
                                 120.f/375.f*[UIScreen mainScreen].bounds.size.width,
                                 100.f/375.f*[UIScreen mainScreen].bounds.size.width,
                                 100.f/375.f*[UIScreen mainScreen].bounds.size.width
                                 );
    _god2button.frame=CGRectMake(16.f/375.f*[UIScreen mainScreen].bounds.size.width, _god1button.bottom+40.f/667.f*[UIScreen mainScreen].bounds.size.height, _god1button.width, _god1button.height);
    _god3button.frame=CGRectMake(_god1button.left, _god2button.bottom+20.f/667.f*[UIScreen mainScreen].bounds.size.height, _god1button.width, _god1button.height);
    _god4button.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-_god1button.width-16.f/375.f*[UIScreen mainScreen].bounds.size.width, _god2button.top, _god1button.width, _god1button.height);
    _normalbutton.frame=CGRectMake([UIScreen mainScreen].bounds.size.width*0.5-40.f/375.f*[UIScreen mainScreen].bounds.size.width*0.5, _god1button.bottom+30.f/667.f*[UIScreen mainScreen].bounds.size.height, 40.f/375.f*[UIScreen mainScreen].bounds.size.width, 40.f/375.f*[UIScreen mainScreen].bounds.size.width);
    _easybutton.frame=CGRectMake(_normalbutton.left-_normalbutton.width-3.f/375.f*[UIScreen mainScreen].bounds.size.width, _normalbutton.top, _normalbutton.width, _normalbutton.height);
    _hardbutton.frame=CGRectMake(_normalbutton.right+3.f/375.f*[UIScreen mainScreen].bounds.size.width, _normalbutton.top, _normalbutton.width, _normalbutton.height);
    _backbutton.frame=CGRectMake(_easybutton.left, _easybutton.bottom+20.f/667.f*[UIScreen mainScreen].bounds.size.height, 60.f/375.f*[UIScreen mainScreen].bounds.size.width, 60.f/375.f*[UIScreen mainScreen].bounds.size.width);
    _enterbutton.frame=CGRectMake(_hardbutton.right-_backbutton.width, _backbutton.top, _backbutton.width, _backbutton.height);
    
}

- (IBAction)god1:(UIButton *)sender {
}
- (IBAction)god2:(UIButton *)sender {
}
- (IBAction)god3:(UIButton *)sender {
}
- (IBAction)god4:(UIButton *)sender {
}
- (IBAction)easy:(UIButton *)sender {
}
- (IBAction)normal:(UIButton *)sender {
}
- (IBAction)hard:(UIButton *)sender {
}
- (IBAction)back:(UIButton *)sender {
    
         [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)enter:(UIButton *)sender {
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IAGameStoryboard" bundle:nil];
    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"GamePage"];
    [self presentViewController:homeVC animated:NO completion:nil];

}
@end
