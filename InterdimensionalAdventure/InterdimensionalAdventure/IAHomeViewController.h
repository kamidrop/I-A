//
//  IAHomeViewController.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAHomeViewController : UIViewController
- (IBAction)BeginGame:(UIButton *)sender;
- (IBAction)EndGame:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *begin;
@property (weak, nonatomic) IBOutlet UIButton *end;
@property (weak, nonatomic) IBOutlet UIImageView *backimage;

@end
