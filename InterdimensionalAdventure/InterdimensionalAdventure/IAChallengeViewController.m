//
//  IAChallengeViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAChallengeViewController.h"
#import "collectionModel.h"
#import "UIView+Extension.h"
#import "IAtopView.h"
#import "IAbottomView.h"
@interface IAChallengeViewController ()
@property(strong,nonatomic)NSMutableArray *Challenge;
@property(assign,nonatomic)NSUInteger ChallengeNum;
@end

@implementation IAChallengeViewController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
       [self shipei];
    [self AddChooseChallenge];
}


-(NSMutableArray *)Challenge
{
    if(_Challenge==nil)
    {
        _Challenge=[NSMutableArray array];
        NSArray * collectionDictArray=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"collectionlist.plist" ofType:nil]];
        for (int i=0; i<collectionDictArray.count; i++) {
            NSDictionary *dict=collectionDictArray[i];
            collectionModel *Challenge=[collectionModel collectionModelWithDict:dict];
            [_Challenge addObject:Challenge];
        }
        
    }
    return _Challenge;
    
}
#pragma make 适配
-(void)shipei
{
//    @property (weak, nonatomic) IBOutlet UIImageView *backgroundimage;
//    @property (weak, nonatomic) IBOutlet UIScrollView *Challengeicon;
//    
//    @property (weak, nonatomic) IBOutlet UITextView *Challengebackground;
//    - (IBAction)back:(UIButton *)sender;
//    
//    @property (weak, nonatomic) IBOutlet UIButton *backimage;
//    
//    - (IBAction)yes:(UIButton *)sender;
//    @property (weak, nonatomic) IBOutlet UIButton *yesimage;
    _backgroundimage.frame=[UIScreen mainScreen].bounds;
    _Challengeicon.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-200.f/375.f*[UIScreen mainScreen].bounds.size.width)/2, 50.f/667.f*[UIScreen mainScreen].bounds.size.height, 200.f/375.f*[UIScreen mainScreen].bounds.size.width, 200.f/375.f*[UIScreen mainScreen].bounds.size.width);
    _Challengebackground.frame=CGRectMake(0, _Challengeicon.bottom+20.f/667.f*[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 250.f/667.f*[UIScreen mainScreen].bounds.size.height);
    _backimage.frame=CGRectMake(15.f/375.f*[UIScreen mainScreen].bounds.size.width, 600.f/667.f*[UIScreen mainScreen].bounds.size.height, 60.f/375.f*[UIScreen mainScreen].bounds.size.width, 60.f/375.f*[UIScreen mainScreen].bounds.size.width);
    _yesimage.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-_backimage.right, _backimage.top, _backimage.width, _backimage.height);

    
}
#pragma make 初始化界面
-(void)AddChooseChallenge
{
    _ChallengeNum=0;
    _Challengeicon.delegate=self;
    for (int i=0; i<self.Challenge.count; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];

        [_Challengeicon addSubview:imageView];
        
        imageView.frame=CGRectMake(_Challengeicon.frame.size.width*i , 0, _Challengeicon.frame.size.width, _Challengeicon.frame.size.height);
        
    }
    collectionModel *model=self.Challenge[0];

    _Challengebackground.text=model.Text;
    _Challengeicon.contentSize=CGSizeMake((_Challenge.count+1)*_Challengeicon.frame.size.width+1, _Challengeicon.frame.size.height);
    UIImageView* imageview=[[UIImageView alloc]init];
    

    [_Challengeicon addSubview:imageview];
    imageview.frame=CGRectMake(_Challengeicon.frame.size.width*_Challenge.count , 0, _Challengeicon.frame.size.width, _Challengeicon.frame.size.height);
    _Challengeicon.pagingEnabled=YES;
    [_Challengeicon setShowsHorizontalScrollIndicator:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(_Challengeicon.contentOffset.x>_Challenge.count *(_Challengeicon.frame.size.width))
    { _Challengeicon.contentOffset=CGPointZero;
        
    }
    
    if(_Challengeicon.contentOffset.x<CGPointZero.x)
    {    _Challengeicon.contentOffset=CGPointMake(_Challengeicon.frame.size.width*_Challenge.count, 0);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    _ChallengeNum=(_Challengeicon.contentOffset.x+1)/_Challengeicon.frame.size.width;
    if (_ChallengeNum>_Challenge.count-1) {
        _ChallengeNum=0;
    }
    collectionModel *model=self.Challenge[_ChallengeNum];
    _Challengebackground.text=model.Text;
    
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


- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)yes:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)particular:(UIButton *)sender {
}
@end
