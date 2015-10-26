//
//  IAHelpViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAHelpViewController.h"

@interface IAHelpViewController ()

@end

@implementation IAHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _helpScrollView.frame=[UIScreen mainScreen].bounds;
    _PageControl.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, 637.0f/667.0f*[UIScreen mainScreen].bounds.size.height);
    // Do any additional setup after loading the view.
    [self HelpScrowView];
    _PageControl.numberOfPages=5;
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
#pragma make 设置HelpScrowView包括显示的图片 以及contentsize等；
-(void)HelpScrowView
{
    for (int i=0; i<5; i++) {
        UIImageView*imageview=[[UIImageView alloc]init];
        NSString *imagename=[NSString stringWithFormat:@"introduction_%i",i+1];
        [imageview setImage:[UIImage imageNamed:imagename]];
        imageview.frame=CGRectMake(i*[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        if (i==4) {
            [self AddStartButton:imageview];
        }
        
         [_helpScrollView addSubview:imageview];
    }
    _helpScrollView.contentSize=CGSizeMake(5*[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    _helpScrollView.pagingEnabled=YES;
    _helpScrollView.bounces=NO;

}
#pragma make添加进入城镇的按钮
-(void)AddStartButton:(UIImageView*)imageview
{
    imageview.userInteractionEnabled=YES;
    
    UIButton*startbutton=[[UIButton alloc]init];
    startbutton.bounds=CGRectMake(0, 0, 122, 32);
    startbutton.center=CGPointMake([UIScreen mainScreen].bounds.size.width*0.5, 0.85*[UIScreen mainScreen].bounds.size.height);
    
    [startbutton setBackgroundImage:[UIImage imageNamed:@"introduction_enter_nomal"] forState:UIControlStateNormal];
    [startbutton setBackgroundImage:[UIImage imageNamed:@"introduction_enter_press"] forState:UIControlStateHighlighted];
    [imageview addSubview:startbutton];
    [self.view bringSubviewToFront:startbutton];
    [startbutton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma make 进入城镇
-(void)startGame:(UIButton*)sender
{
    //直接将主页设置为window的rootviewcontorller 这样就不会再回到欢迎页；
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IATownStoryboard" bundle:nil];
    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"TownPage"];
//     [self presentViewController:homeVC animated:NO completion:nil];
        [UIApplication sharedApplication].keyWindow.rootViewController=homeVC;
}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger number =(NSUInteger)_helpScrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    _PageControl.currentPage=number;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
