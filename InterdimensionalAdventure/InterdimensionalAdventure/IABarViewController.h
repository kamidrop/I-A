//
//  IABarViewController.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/17.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IABarViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundimage;
@property (weak, nonatomic) IBOutlet UIScrollView *heroicon;

@property (weak, nonatomic) IBOutlet UITextView *herobackground;
- (IBAction)back:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *backimage;

- (IBAction)yes:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *yesimage;
- (IBAction)particular:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *particularimage;

@end
