
//
//  IAtopView.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAtopView.h"
#import "UIView+Extension.h"
@implementation IAtopView

- (IBAction)Figure:(UIButton *)sender {
    if([_delegate respondsToSelector:@selector(EnterFifureDidClicked:)])
    {
        [_delegate EnterFifureDidClicked:sender];
    }
    
}
- (IBAction)flee:(UIButton *)sender {
    if([_delegate respondsToSelector:@selector(backTownDidClicked:)])
    {
        [_delegate backTownDidClicked:sender];
    }
}

+(instancetype)IAtopView
{
    IAtopView*view=[[[NSBundle mainBundle]loadNibNamed:@"IAtopView" owner:nil options:nil]lastObject];
    view.frame= CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100/667.f*[UIScreen mainScreen].bounds.size.height);

    return view;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    _backimage.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _Figure.frame=CGRectMake(0, 0, 90.f/375.f*self.frame.size.width, self.frame.size.height);

    _power.frame=CGRectMake(_Figure.right, 0, 27.f/375.f*self.frame.size.width,22.f/120.f*_Figure.height);

    _powerLable.frame=CGRectMake(_power.right, 0, _power.width, _power.height);

    _wisdom.frame=CGRectMake(_powerLable.right, 0, _power.width, _power.height);
    _wisdomLable.frame=CGRectMake(_wisdom.right, 0, _power.width, _power.height);

    _Skill.frame=CGRectMake(_wisdomLable.right, 0, _power.width, _power.height);

    _SkillLable.frame=CGRectMake(_Skill.right, 0, _power.width, _power.height);

    _corporeity.frame=CGRectMake(_SkillLable.right, 0, _power.width, _power.height);

    _corporeityLable.frame=CGRectMake(_corporeity.right, 0, _power.width, _power.height);

    _gold.frame=CGRectMake(_corporeityLable.right, 0, _power.width, _Figure.height/4);

    _goldLable.frame=CGRectMake(_gold.right, 0, self.frame.size.width-_gold.right,_Figure.height/4);

    _Attack.frame=CGRectMake(_Figure.right, _power.bottom+8.f/120.f*self.frame.size.height, _power.width, _power.height);

    _AttackLable.frame=CGRectMake(_Attack.right, _Attack.top, _power.width, _power.height);

    _mana.frame=CGRectMake(_AttackLable.right, _Attack.top, _power.width, _power.height);

    _manaLable.frame=CGRectMake(_mana.right, _Attack.top, _power.width, _power.height);

    _Hitrate.frame=CGRectMake(_manaLable.right, _Attack.top, _power.width, _power.height);

    _HitrateLable.frame=CGRectMake(_Hitrate.right, _Attack.top, _power.width, _power.height);

    _resistance.frame=CGRectMake(_HitrateLable.right, _Attack.top, _power.width, _power.height);

    _resistanceLable.frame=CGRectMake(_resistance.right, _Attack.top, _power.width, _power.height);

    _accouter.frame=CGRectMake(_Figure.right, _Attack.bottom+8.f/120.f*self.frame.size.height, _power.width*2, self.frame.size.height-_Attack.bottom-8.f/120.f*self.frame.size.height);

    _lv.frame=CGRectMake(_accouter.right, _accouter.top, _accouter.width, _accouter.height/2);

    _Experience.frame=CGRectMake(_accouter.right, _lv.bottom, _accouter.width, _accouter.height/2);
    _god.frame=CGRectMake(_lv.right, _accouter.top, _accouter.width, _accouter.height);

    _Checkpoint.frame=CGRectMake(_gold.left, _gold.bottom, _gold.width+_goldLable.width, _gold.height);

    _Flee.frame=CGRectMake(_gold.left, _Checkpoint.bottom, _gold.width+_goldLable.width, _gold.height);

     _Setup.frame=CGRectMake(_gold.left, _Flee.bottom, _gold.width+_goldLable.width, _gold.height);
    

    
}
-(void)setMap:(mapmodel *)map
{
    _Checkpoint.text=[map.num stringValue];
}
-(void)setCollection:(collectionModel *)collection
{
    
    [_Figure setBackgroundImage:[UIImage imageNamed:collection.Figure] forState:UIControlStateNormal];
    _powerLable.text=[collection.power stringValue];
    _wisdomLable.text=[collection.wisdom stringValue];
    _SkillLable.text=[collection.skill stringValue];
    _corporeityLable.text=[collection.corporeity stringValue];
    _AttackLable.text=[collection.attack stringValue];
    _manaLable.text=[collection.mana stringValue];
    _HitrateLable.text=[collection.hitrate stringValue];

}

@end
