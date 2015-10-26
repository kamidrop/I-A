//
//  IATownViewController.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAtopView.h"
@interface IATownViewController : UIViewController<IAtopViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backimage;
@property (weak, nonatomic) IBOutlet UIButton *bar;
- (IBAction)bar:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *Training;
- (IBAction)Training:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *challenge;
- (IBAction)challenge:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *shop;
- (IBAction)shop:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *enter;
- (IBAction)enter:(UIButton *)sender;

@end
