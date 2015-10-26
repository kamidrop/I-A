
//
//  IAheaderView.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAheaderView.h"

@implementation IAheaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)IAheaderView
{
    IAheaderView*view=[[[NSBundle mainBundle]loadNibNamed:@"IAheaderView" owner:nil options:nil]lastObject];
    view.frame= CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50.f/667.f*[UIScreen mainScreen].bounds.size.height);
    
    return view;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _backgroundimage.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _backbutton.frame=CGRectMake((self.frame.size.width-50.f/375.f*self.frame.size.width)*0.5f, 0, 50.f/375.f*self.frame.size.width, 50.f/375.f*self.frame.size.width);
}


- (IBAction)back:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(IAheaderViewdidback:)]) {
        [_delegate IAheaderViewdidback:self];
        
    }
}
@end
