//
//  IAmonsterview.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/10/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "monsterModel.h"
@interface IAmonsterview : UIView
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UILabel *attark;
@property (weak, nonatomic) IBOutlet UILabel *hp;
+(instancetype)monsterview;
@property(strong,nonatomic)monsterModel*monster;
@end
