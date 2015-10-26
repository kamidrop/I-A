//
//  IAHomeViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAHomeViewController.h"
#import "IAHelpViewController.h"
@interface IAHomeViewController ()

@end

@implementation IAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backimage.frame=[UIScreen mainScreen].bounds;
    _begin.frame=CGRectMake([UIScreen mainScreen].bounds.size.width*0.5-44, 0.5*[UIScreen mainScreen].bounds.size.height, 88, 44);
    _end.frame=CGRectMake([UIScreen mainScreen].bounds.size.width*0.5-44, 0.6*[UIScreen mainScreen].bounds.size.height, 88, 44);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma make 开始游戏
- (IBAction)BeginGame:(UIButton *)sender {
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IAHelpStoryboard" bundle:nil];
    IAHelpViewController*HelpVC=[storyboard instantiateViewControllerWithIdentifier:@"Helppage"];
    [UIApplication sharedApplication].keyWindow.rootViewController=HelpVC;
//    IAHelpViewController*HelpVC=[storyboard instantiateViewControllerWithIdentifier:@"Helppage"];
//    [self presentViewController:HelpVC animated:YES completion:nil];
}
#pragma make 结束游戏
- (IBAction)EndGame:(UIButton *)sender {
    exit(0);
}
@end
