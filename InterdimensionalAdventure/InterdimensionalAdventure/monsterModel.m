//
//  monsterModel.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/10/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "monsterModel.h"

@implementation monsterModel
+(instancetype)mosterModelWithDict:(NSDictionary *)dict
{
    monsterModel*model=[[monsterModel alloc]init];
    if (model) {
        [model setValuesForKeysWithDictionary:dict];
    }
    return model;
}
@end
