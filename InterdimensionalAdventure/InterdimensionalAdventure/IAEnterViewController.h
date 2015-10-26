//
//  IAEnterViewController.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAEnterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *god1button;
- (IBAction)god1:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *god2button;
- (IBAction)god2:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *god3button;
- (IBAction)god3:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *god4button;
- (IBAction)god4:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *easybutton;
- (IBAction)easy:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *normalbutton;
- (IBAction)normal:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *hardbutton;
- (IBAction)hard:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *backbutton;
- (IBAction)back:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *enterbutton;

- (IBAction)enter:(UIButton *)sender;
@end
