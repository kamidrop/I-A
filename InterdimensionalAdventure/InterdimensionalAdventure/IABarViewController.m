//
//  IABarViewController.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IABarViewController.h"
#import "collectionModel.h"
#import "UIView+Extension.h"
#import "IAtopView.h"
#import "IAbottomView.h"
@interface IABarViewController ()
@property(strong,nonatomic)NSMutableArray *hero;
@property(assign,nonatomic)NSUInteger heroNum;
@end

@implementation IABarViewController
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
    [self AddChooseHero];
}


-(NSMutableArray *)hero
{
    if(_hero==nil)
    {
        _hero=[NSMutableArray array];
        NSArray * collectionDictArray=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Property List.plist" ofType:nil]];
        for (int i=0; i<collectionDictArray.count; i++) {
            NSDictionary *dict=collectionDictArray[i];
            collectionModel *hero=[collectionModel collectionModelWithDict:dict];
            [_hero addObject:hero];
        }
        
    }
    return _hero;

}
#pragma make 适配
-(void)shipei
{

    _backgroundimage.frame=[UIScreen mainScreen].bounds;
    _heroicon.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-200.f/375.f*[UIScreen mainScreen].bounds.size.width)/2, 50.f/667.f*[UIScreen mainScreen].bounds.size.height, 200.f/375.f*[UIScreen mainScreen].bounds.size.width, 200.f/375.f*[UIScreen mainScreen].bounds.size.width);
    _herobackground.frame=CGRectMake(0, _heroicon.bottom+20.f/667.f*[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 250.f/667.f*[UIScreen mainScreen].bounds.size.height);
    _backimage.frame=CGRectMake(15.f/375.f*[UIScreen mainScreen].bounds.size.width, 600.f/667.f*[UIScreen mainScreen].bounds.size.height, 60.f/375.f*[UIScreen mainScreen].bounds.size.width, 60.f/375.f*[UIScreen mainScreen].bounds.size.width);
    _yesimage.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-_backimage.right, _backimage.top, _backimage.width, _backimage.height);
    _particularimage.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-100.f/375.f*[UIScreen mainScreen].bounds.size.width)/2, _backimage.top, 100.f/375.f*[UIScreen mainScreen].bounds.size.width, _backimage.height);

}
#pragma make 初始化界面
-(void)AddChooseHero
{
    _heroNum=0;
    _heroicon.delegate=self;
    for (int i=0; i<self.hero.count; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
         collectionModel *model=self.hero[i];
        NSString *imagename=model.Pic;
        [imageView setImage:[UIImage imageNamed:imagename]];
        [_heroicon addSubview:imageView];
        
        imageView.frame=CGRectMake(_heroicon.width*i , 0, _heroicon.width, _heroicon.height);

    }
    collectionModel *model=self.hero[0];
    NSString *imagename=model.Pic;
    _herobackground.text=model.Text;
    _heroicon.contentSize=CGSizeMake((_hero.count+1)*_heroicon.frame.size.width+1, _heroicon.frame.size.height);
    UIImageView* imageview=[[UIImageView alloc]init];

    [imageview setImage:[UIImage imageNamed:imagename]];
    [_heroicon addSubview:imageview];
    imageview.frame=CGRectMake(_heroicon.frame.size.width*_hero.count , 0, _heroicon.frame.size.width, _heroicon.frame.size.height);
   
    _heroicon.pagingEnabled=YES;
    [_heroicon setShowsHorizontalScrollIndicator:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(_heroicon.contentOffset.x>_hero.count *(_heroicon.frame.size.width))
    { _heroicon.contentOffset=CGPointZero;
        
    }
    
    if(_heroicon.contentOffset.x<CGPointZero.x)
    {    _heroicon.contentOffset=CGPointMake(_heroicon.frame.size.width*_hero.count, 0);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   
    _heroNum=(_heroicon.contentOffset.x+1)/_heroicon.frame.size.width;
    if (_heroNum>_hero.count-1) {
        _heroNum=0;
    }
   collectionModel *model=self.hero[_heroNum];
    _herobackground.text=model.Text;
    
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
    collectionModel *model=self.hero[_heroNum];
    
    for(IAtopView*subview in self.view.window.subviews)
    {

        if ([subview isKindOfClass:[IAtopView class]]) {
            subview.collection=model;
        }
    }

    for(IAbottomView*subview in self.view.window.subviews)
    {
        
        if ([subview isKindOfClass:[IAbottomView class]]) {
            subview.collection=model;
        }
    }
    
   
      [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)particular:(UIButton *)sender {
}
@end
