//
//  IAbottomView.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "collectionModel.h"
@interface IAbottomView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backimage;
@property (weak, nonatomic) IBOutlet UIButton *MonsterProperty;
@property (weak, nonatomic) IBOutlet UIImageView *hp;
@property (weak, nonatomic) IBOutlet UILabel *hpLable;
@property (weak, nonatomic) IBOutlet UIImageView *mp;
@property (weak, nonatomic) IBOutlet UILabel *mpLable;
@property (weak, nonatomic) IBOutlet UIImageView *shield;
@property (weak, nonatomic) IBOutlet UILabel *shieldLable;
@property (weak, nonatomic) IBOutlet UIImageView *skil;
@property (weak, nonatomic) IBOutlet UIButton *skil1;
@property (weak, nonatomic) IBOutlet UIButton *skil2;
@property (weak, nonatomic) IBOutlet UIButton *skil3;
@property (weak, nonatomic) IBOutlet UIImageView *Prop;
@property (weak, nonatomic) IBOutlet UIButton *Prop1;
@property (weak, nonatomic) IBOutlet UIButton *Prop2;
@property (weak, nonatomic) IBOutlet UIButton *Prop3;
+(instancetype)IAbottomView;
@property(strong,nonatomic)collectionModel*collection;
@end
