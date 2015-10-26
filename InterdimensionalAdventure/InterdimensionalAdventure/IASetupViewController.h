//
//  IASetupViewController.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/24.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IASetupViewController : UIViewController
- (IBAction)back:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backimage;
@property (weak, nonatomic) IBOutlet UIButton *music;
@property (weak, nonatomic) IBOutlet UIButton *sound;
@property (weak, nonatomic) IBOutlet UIButton *gameout;
@property (weak, nonatomic) IBOutlet UIButton *back;


@end
