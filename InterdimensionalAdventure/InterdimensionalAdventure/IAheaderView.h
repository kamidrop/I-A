//
//  IAheaderView.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IAheaderView;
@protocol IAheaderViewDelegate<NSObject>


-(void)IAheaderViewdidback:(IAheaderView*)playBar;

@end
@interface IAheaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backgroundimage;
- (IBAction)back:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *backbutton;
+(instancetype)IAheaderView;
@property(weak,nonatomic)id<IAheaderViewDelegate>delegate;
@end
