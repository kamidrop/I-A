//
//  IAtopView.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "collectionModel.h"
#import "mapmodel.h"
@protocol IAtopViewDelegate <NSObject>

@optional
-(void)EnterFifureDidClicked:(UIButton*)Figure;
-(void)backTownDidClicked:(UIButton*)Flee;
@end



@interface IAtopView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backimage;
@property (weak, nonatomic) IBOutlet UIButton *Figure;
@property (weak, nonatomic) IBOutlet UIImageView *power;
@property (weak, nonatomic) IBOutlet UILabel *powerLable;
@property (weak, nonatomic) IBOutlet UIImageView *wisdom;
@property (weak, nonatomic) IBOutlet UILabel *wisdomLable;
@property (weak, nonatomic) IBOutlet UIImageView *Skill;
@property (weak, nonatomic) IBOutlet UILabel *SkillLable;
@property (weak, nonatomic) IBOutlet UIImageView *corporeity;
@property (weak, nonatomic) IBOutlet UILabel *corporeityLable;
@property (weak, nonatomic) IBOutlet UIImageView *gold;
@property (weak, nonatomic) IBOutlet UILabel *goldLable;
@property (weak, nonatomic) IBOutlet UIImageView *Attack;
@property (weak, nonatomic) IBOutlet UILabel *AttackLable;
@property (weak, nonatomic) IBOutlet UIImageView *mana;
@property (weak, nonatomic) IBOutlet UILabel *manaLable;
@property (weak, nonatomic) IBOutlet UIImageView *Hitrate;
@property (weak, nonatomic) IBOutlet UILabel *HitrateLable;
@property (weak, nonatomic) IBOutlet UIImageView *resistance;
@property (weak, nonatomic) IBOutlet UILabel *resistanceLable;
@property (weak, nonatomic) IBOutlet UIButton *accouter;
@property (weak, nonatomic) IBOutlet UILabel *lv;
@property (weak, nonatomic) IBOutlet UILabel *Experience;
@property (weak, nonatomic) IBOutlet UIButton *god;
@property (weak, nonatomic) IBOutlet UILabel *Checkpoint;
@property (weak, nonatomic) IBOutlet UIButton *Flee;
@property (weak, nonatomic) IBOutlet UIButton *Setup;
+(instancetype)IAtopView;
- (IBAction)Figure:(UIButton *)sender;

@property(strong,nonatomic)collectionModel*collection;
@property(strong,nonatomic)mapmodel*map;
@property(weak,nonatomic)id<IAtopViewDelegate>delegate;
@end
