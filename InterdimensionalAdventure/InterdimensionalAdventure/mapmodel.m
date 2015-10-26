//
//  mapmodel.m
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "mapmodel.h"

@implementation mapmodel
+(instancetype)mapWithDict:(NSDictionary *)dict
{
    mapmodel*model=[[mapmodel alloc]init];
    if (model) {
        model.num=[dict objectForKey:@"num"];
    }
    return model;
}
@end
