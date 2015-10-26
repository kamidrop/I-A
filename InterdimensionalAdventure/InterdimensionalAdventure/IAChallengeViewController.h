//
//  IAChallengeViewController.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAChallengeViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundimage;
@property (weak, nonatomic) IBOutlet UIScrollView *Challengeicon;

@property (weak, nonatomic) IBOutlet UITextView *Challengebackground;
- (IBAction)back:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *backimage;

- (IBAction)yes:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *yesimage;


@end
