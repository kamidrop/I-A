
//
//  IAGameViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/28.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAGameViewController.h"
#import "IAGameview.h"
#import "IAtopView.h"
#import "IAbottomView.h"
#import "UIView+Extension.h"
#import "IAmonsterview.h"
#import "monsterModel.h"
@interface IAGameViewController ()
@property(weak,nonatomic)IAGameview*IAgameview;

@end

@implementation IAGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    IAGameview  *IAGameView=[IAGameview  IAGameview];
    _IAgameview=IAGameView;
    IAGameView.delegate=self;
    IAGameView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-100/667.f*[UIScreen mainScreen].bounds.size.height-80.f/667.f*[UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:IAGameView];

}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@",self.view.window.subviews);
    for(UIView*subview in self.view.window.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UITransitionView")]) {
            subview.frame=CGRectMake(0, 100/667.f*[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-100/667.f*[UIScreen mainScreen].bounds.size.height-80.f/667.f*[UIScreen mainScreen].bounds.size.height);
        }
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma make 探索检测
-(void)didButtonClicked:(UIButton *)options
{
    options.hidden=YES;
    
}
#pragma make 攻击检测（未完成！！！！）
-(void)didmonsterButtonClicked:(UIButton *)senderview
{
//    IAmonsterview*view=senderview.superview;
    UIView*view=senderview.superview;
    IAmonsterview*moster=(IAmonsterview*)view;
    int oldhp=[moster.hp.text intValue];
    int Attack = 0;
    for(IAtopView*subview in self.view.window.subviews)
    {
        if ([subview isKindOfClass:[IAtopView class]]) {
            Attack=[subview.powerLable.text intValue];
        }
    }
    
    NSLog(@"attarck");
    int nowhp=oldhp-Attack;
    moster.hp.text=[NSString stringWithFormat:@"%d",nowhp];
    if (nowhp<=0) {
        moster.alpha=0;
    }
}
#pragma make 进入下层地图层数＋1
-(void)didDoorButtonClicked:(UIButton *)sender
{
//    [self dismissViewControllerAnimated:NO completion:nil];

    for (UIView*view in self.view.subviews) {
        if ([view isKindOfClass:[IAGameview class]]) {
            [view removeFromSuperview];
        }
        
    }
    for(IAtopView*subview in self.view.window.subviews)
    {
        
        
        if ([subview isKindOfClass:[IAtopView class]]) {
            int checknum=[subview.Checkpoint.text intValue]+1;
            NSString*ch=[NSString stringWithFormat:@"%d",checknum];
            subview.Checkpoint.text=ch;
        }
    }
    IAGameview *IAgameview=[IAGameview IAGameview];
    _IAgameview=IAgameview;
    IAgameview.delegate=self;
    IAgameview.frame=CGRectMake(0, 0, self.view.width, [UIScreen mainScreen].bounds.size.height-100/667.f*[UIScreen mainScreen].bounds.size.height-80.f/667.f*[UIScreen mainScreen].bounds.size.height);
    NSLog(@"%@",self.view.window.subviews);
    [self.view addSubview:IAgameview];
    
    
    
}



@end
