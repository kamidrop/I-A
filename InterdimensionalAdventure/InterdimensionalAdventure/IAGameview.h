//
//  IAGameview.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/28.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAmonsterview.h"
@protocol IAGameviewDelegate <NSObject>

@optional

-(void)didButtonClicked:(UIButton *)options;
-(void)didDoorButtonClicked:(UIButton*)sender;
-(void)didmonsterButtonClicked:(UIButton*)senderview;
@required


@end
@interface IAGameview : UIView
@property(weak,nonatomic)UIButton*doorbutton;
@property(weak,nonatomic)UIButton*mosterbutton;
@property(strong,nonatomic)NSMutableArray*randomArray;
@property(strong,nonatomic)NSMutableArray*startArray;
@property(strong,nonatomic)NSMutableArray *monster;
@property(assign,nonatomic)int monsternumber;
+(instancetype)IAGameview;

@property(weak,nonatomic)id<IAGameviewDelegate> delegate;
@end
