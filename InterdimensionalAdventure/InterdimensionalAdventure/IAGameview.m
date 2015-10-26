//
//  IAGameview.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/9/28.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "IAGameview.h"
#import "UIView+Extension.h"
#import "IAmonsterview.h"
#import "monsterModel.h"

@implementation IAGameview
-(NSMutableArray *)monster
{
    if(_monster==nil)
    {
        _monster=[NSMutableArray array];
        NSArray * monsterDictArray=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Monster List.plist" ofType:nil]];
        for (int i=0; i<monsterDictArray.count; i++) {
            NSDictionary *dict=monsterDictArray[i];
            monsterModel *monster=[monsterModel mosterModelWithDict:dict];
            [_monster addObject:monster];
        }
        
    }
    return _monster;
}
-(NSArray *)randomArray
{
    if (_startArray==nil) {
        _startArray=[NSMutableArray array];
        //随机数从这里边产生
        for (int i=0; i<49; i++) {
            NSNumber*array=[NSNumber numberWithInt:i];
            [_startArray addObject:array];
        }
    }
    //随机数产生结果
    if (_randomArray==nil) {
        _randomArray=[NSMutableArray array];
        NSMutableArray *resultArray=[[NSMutableArray alloc] initWithCapacity:0];
        //随机数个数
        
        for (int i=0; i<_monsternumber; i++) {
            int t=arc4random()%_startArray.count;
            resultArray[i]=_startArray[t];
            [_randomArray addObject:resultArray[i]];
            _startArray[t]=[_startArray lastObject]; //为更好的乱序，故交换下位置
            [_startArray removeLastObject];
            
        }
    }
    return _randomArray;
}

+(instancetype)IAGameview
{
    IAGameview*view=[[IAGameview alloc]init];
    return view;
}
-(instancetype)init
{
    self=[super init];
    if(self)
    {
        [self addSubviews];
    }
    return self;
}
-(void)addSubviews
{

    for (int i=0; i<49; i++) {
        
        UIButton *button=[[UIButton alloc]init];
        
        [self addSubview:button];
        //        设置按钮的背景图片；
        button.backgroundColor=[UIColor blackColor];
        [button setTag:i];
        //        给按钮设置响应函数；
        [button addTarget:self action:@selector(optionbuttonClicked:) forControlEvents:UIControlEventTouchUpInside] ;
        button.userInteractionEnabled=NO;
        
        
    }
    _monsternumber=arc4random()%8+8;
    for (int i=0; i<_monsternumber-1; i++){
        IAmonsterview*monsterbutton=[IAmonsterview monsterview];
        [self addSubview:monsterbutton];
        if (i==0) {
                    [monsterbutton.button setTitle:@"next" forState:UIControlStateNormal];
                    [monsterbutton.button addTarget:self action:@selector(nextbuttonClicked:) forControlEvents:UIControlEventTouchUpInside] ;
        }
        else{
        [monsterbutton.button setTitle:@"monster2" forState:UIControlStateNormal];
            int t=arc4random()%3;
            monsterModel*model=self.monster[t];
            monsterbutton.monster=model;
            [monsterbutton.button addTarget:self action:@selector(monsterbuttonClicked:) forControlEvents:UIControlEventTouchUpInside] ;
        }
        monsterbutton.button.backgroundColor=[UIColor brownColor];
        [monsterbutton.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

        monsterbutton.tag=100+i;
        monsterbutton.hidden=YES;
        
    }
    
    for (UIButton*button in self.subviews)
    {
        
        if(button.tag==[self.randomArray[0] intValue])
        {
            button.hidden=YES;
        }
    }

    
    for (UIButton*button in self.subviews)
    {
        if (button.hidden==YES)
        {
            for (UIButton*button1 in self.subviews )
            {
                if (((button1.tag/7==button.tag/7+1)&&(button1.tag%7==button.tag%7))
                    ||((button1.tag/7==button.tag/7-1)&&(button1.tag%7==button.tag%7))
                    ||((button1.tag%7==button.tag%7-1)&&(button1.tag/7==button.tag/7))
                    ||((button1.tag%7==button.tag%7+1)&&(button1.tag/7==button.tag/7))
                    )
                {
                    button1.userInteractionEnabled=YES;
                    button1.backgroundColor=[UIColor grayColor];
                    
                }
            }
            
        }
    }
    
    
}
-(void)monsterbuttonClicked:(UIButton*)sender
{
    if ([_delegate respondsToSelector:@selector(didmonsterButtonClicked:)]) {

             [_delegate didmonsterButtonClicked:sender];
    }

}
-(void)nextbuttonClicked:(UIButton*)sender
{
    if ([_delegate respondsToSelector:@selector(didDoorButtonClicked:)]) {
        [_delegate didDoorButtonClicked:sender];
    }
}
-(void)optionbuttonClicked:(UIButton*)sender{
    //    判断我的代理是否实现协议中的方法，如果是则调用 不是则不处理
    if ([_delegate respondsToSelector:@selector(didButtonClicked:)]) {
        
        [_delegate didButtonClicked:sender];
    }
    for (UIButton*buttonA in self.subviews)
    {
        if ([buttonA isKindOfClass:[UIButton class]])
        {
            if (buttonA.hidden==YES)
            {
                
                for (IAmonsterview*buttonb in self.subviews)
                {
                    if ([buttonb isKindOfClass:[IAmonsterview class]])
                    {
                        if( CGRectContainsRect(buttonA.frame,buttonb.frame) )
                        {
                            buttonb.hidden=NO;
                            
                        }
                    }
                }
                
                
                
                
                for (UIButton*button1 in self.subviews )
                {
                    if (((button1.tag/7==buttonA.tag/7+1)&&(button1.tag%7==buttonA.tag%7))
                        ||((button1.tag/7==buttonA.tag/7-1)&&(button1.tag%7==buttonA.tag%7))
                        ||((button1.tag%7==buttonA.tag%7-1)&&(button1.tag/7==buttonA.tag/7))
                        ||((button1.tag%7==buttonA.tag%7+1)&&(button1.tag/7==buttonA.tag/7))
                        )
                    {
                        button1.userInteractionEnabled=YES;
                        button1.backgroundColor=[UIColor grayColor];
                        
                    }
                    
                }
                
            }
            
        }
    }
    
}
//3重写layoutsubviews 在这里设置哪些可能变化的自控件的frame。位置；
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat w=self.width/7;
    CGFloat h=self.height/7;

    //    遍历所有子控件 ，并设置他们的frame
    int num=49;
    for (int k=1; k<_randomArray.count; k++)
    {
        
         int j=[self.randomArray[k] intValue];
    for (int i=0 ;i<self.subviews.count-(_monsternumber-1);i++) {
        
        int column,row;
        column=i%7;
        row=i/7;
        
        CGFloat x=self.width/7*column;
        CGFloat y=self.height/7*row;
        if (i==j)
        {
            IAmonsterview*button=self.subviews[num];
            button.frame=CGRectMake(x, y, w, h);
        }
         UIButton *button=self.subviews[i];
        
        button.frame=CGRectMake(x, y, w, h);
    }
           num++;
        
    }
}

@end
