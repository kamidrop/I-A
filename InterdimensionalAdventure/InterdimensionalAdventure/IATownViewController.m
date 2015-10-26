//
//  IATownViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IATownViewController.h"
#import "IAbottomView.h"
#import "IAtopView.h"
#import "UIView+Extension.h"
#import "AppDelegate.h"
#import "collectionModel.h"
#import "mapmodel.h"
@interface IATownViewController ()
@property(strong,nonatomic)NSMutableArray *collection;
@property(strong,nonatomic)NSMutableArray *map;
@end

@implementation IATownViewController
-(NSMutableArray *)collection
{
    if(_collection==nil)
    {
        _collection=[NSMutableArray array];
        NSArray * collectionDictArray=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Property List.plist" ofType:nil]];
        for (int i=0; i<collectionDictArray.count; i++) {
            NSDictionary *dict=collectionDictArray[i];
            collectionModel *collection=[collectionModel collectionModelWithDict:dict];
            [_collection addObject:collection];
        }
        
    }
    return _collection;
}
-(NSMutableArray *)map
{
    if(_map==nil)
    {
        _map=[NSMutableArray array];
        NSArray * mapDictArray=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mapList.plist" ofType:nil]];
        for (int i=0; i<mapDictArray.count; i++) {
            NSDictionary *dict=mapDictArray[i];
            mapmodel *map=[mapmodel mapWithDict:dict];
            [_map addObject:map];
        }
        
    }
    return _map;
}
-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    if (self.view.window.subviews.count<3) {
        [self addbottomview];
        [self addtopview];
    }
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

- (void)viewDidLoad {
    [super viewDidLoad];
    _backimage.frame=[UIScreen mainScreen].bounds;
    _enter.frame=CGRectMake(
                            [UIScreen mainScreen].bounds.size.width*0.5-60.f/375.f*[UIScreen mainScreen].bounds.size.width*0.5,
                            [UIScreen mainScreen].bounds.size.height*0.5-60.f/375.f*[UIScreen mainScreen].bounds.size.width*0.5,
                            60.f/375.f*[UIScreen mainScreen].bounds.size.width,
                            60.f/375.f*[UIScreen mainScreen].bounds.size.width
                            );
    
    _bar.frame=CGRectMake(
                          _enter.left-17.f/375.f*[UIScreen mainScreen].bounds.size.width-100.f/375.f*[UIScreen mainScreen].bounds.size.width,
                          _enter.top-54.f/667.f*[UIScreen mainScreen].bounds.size.height-100.f/375.f*[UIScreen mainScreen].bounds.size.width,
                          100.f/375.f*[UIScreen mainScreen].bounds.size.width,
                          100.f/375.f*[UIScreen mainScreen].bounds.size.width
                          );
    _Training.frame=CGRectMake(_bar.right+90.f/375.f*[UIScreen mainScreen].bounds.size.width, _bar.top, _bar.width, _bar.height);
    
    _challenge.frame=CGRectMake(_bar.left, _enter.bottom+54.f/667.f*[UIScreen mainScreen].bounds.size.height, _bar.width, _bar.height);
    _shop.frame=CGRectMake(_Training.left, _challenge.top, _bar.width, _bar.height);



    
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma make 绘制上方状态栏
-(void)addtopview
{
    IAtopView*topview=[IAtopView IAtopView];
    AppDelegate*delegate=[UIApplication sharedApplication].delegate;
     [delegate.window addSubview:topview];
    collectionModel*model=self.collection[0];
    topview.collection=model;
    mapmodel*mapmodel=self.map[0];
    topview.map=mapmodel;
    topview.delegate=self;
}
-(void)EnterFifureDidClicked:(UIButton *)Figure
{
    
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IASetupStoryboard" bundle:nil];
    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"SetupPage"];
           AppDelegate*delegate=[UIApplication sharedApplication].delegate;
    UIViewController*nowViewController=[self topViewControllerWithRootViewController:delegate.window.rootViewController];
    [nowViewController presentViewController:homeVC animated:NO completion:nil];
}
-(void)backTownDidClicked:(UIButton *)Flee
{
         [self dismissViewControllerAnimated:NO completion:nil];
}
#pragma make 找到当前界面的UIViewController
- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}
#pragma make 绘制下方状态栏
-(void)addbottomview
{
    IAbottomView*bottomview=[IAbottomView IAbottomView];

       AppDelegate*delegate=[UIApplication sharedApplication].delegate;
    collectionModel*model=self.collection[0];
    bottomview.collection=model;
     [delegate.window addSubview:bottomview];

  
   
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma make 进入酒店
- (IBAction)bar:(UIButton *)sender {
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IABarStoryboard" bundle:nil];
    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"BarPage"];
    [self presentViewController:homeVC animated:NO completion:nil];
}
- (IBAction)Training:(UIButton *)sender {
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IATrainingStoryboard" bundle:nil];
    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"TrainingPage"];
    [self presentViewController:homeVC animated:NO completion:nil];
}
- (IBAction)challenge:(UIButton *)sender {
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IAChallengeStoryboard" bundle:nil];
    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"ChallengePage"];
    [self presentViewController:homeVC animated:NO completion:nil];
}
- (IBAction)shop:(UIButton *)sender {
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IAShopStoryboard" bundle:nil];
    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"ShopPage"];
    [self presentViewController:homeVC animated:NO completion:nil];
}
- (IBAction)enter:(UIButton *)sender {
    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IAEnterStoryboard" bundle:nil];
    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"EnterPage"];
    [self presentViewController:homeVC animated:NO completion:nil];

//    UIStoryboard*storyboard=[UIStoryboard storyboardWithName:@"IAGameStoryboard" bundle:nil];
//    UIPageViewController*homeVC=[storyboard instantiateViewControllerWithIdentifier:@"GamePage"];
//    [self presentViewController:homeVC animated:NO completion:nil];
}
@end
