//
//  IAmonsterview.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/10/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAmonsterview.h"

@implementation IAmonsterview
+(instancetype)monsterview
{
    IAmonsterview*monster=[[[NSBundle mainBundle]loadNibNamed:@"IAmonsterview" owner:nil options:nil]lastObject];
    return monster;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _button.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _image1.frame=CGRectMake(0, self.frame.size.height*0.75, self.frame.size.width*0.25, self.frame.size.height*0.25);
    _image2.frame=CGRectMake(self.frame.size.width*0.75, self.frame.size.height*0.75, self.frame.size.width*0.25, self.frame.size.height*0.25);
    _attark.frame=CGRectMake(0, self.frame.size.height*0.75, self.frame.size.width*0.25, self.frame.size.height*0.25);
    _hp.frame=CGRectMake(self.frame.size.width*0.75, self.frame.size.height*0.75, self.frame.size.width*0.25, self.frame.size.height*0.25);
}
-(void)setMonster:(monsterModel *)monster
{
    _hp.text=[monster.hp stringValue];
    _attark.text=[monster.Attack stringValue];
    _monster=monster;
//    [_Figure setBackgroundImage:[UIImage imageNamed:collection.Figure] forState:UIControlStateNormal];
//    _powerLable.text=[collection.power stringValue];
//    _wisdomLable.text=[collection.wisdom stringValue];
//    _SkillLable.text=[collection.skill stringValue];
//    _corporeityLable.text=[collection.corporeity stringValue];
//    _AttackLable.text=[collection.attack stringValue];
//    _manaLable.text=[collection.mana stringValue];
//    _HitrateLable.text=[collection.hitrate stringValue];
}
@end
