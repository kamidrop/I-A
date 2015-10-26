//
//  collectionModel.m
//  collection
//
//  Created by neuedu on 15/8/14.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "collectionModel.h"


@implementation collectionModel
+(instancetype)collectionModelWithDict:(NSDictionary *)dict
{
    collectionModel *model=[[collectionModel alloc]init];
    if (model) {
        model.Text=[dict objectForKey:@"text"];
        model.Pic=[dict objectForKey:@"pic"];
        model.Figure=[dict objectForKey:@"figure"];
        model.name=[dict objectForKey:@"name"];
        model.hp=[dict objectForKey:@"hp"];
        model.mp=[dict objectForKey:@"mp"];
        model.shield=[dict objectForKey:@"shield"];
        model.power=[dict objectForKey:@"power"];
        model.wisdom=[dict objectForKey:@"wisdom"];
        model.skill=[dict objectForKey:@"skill"];
        model.corporeity=[dict objectForKey:@"corporeity"];
        model.attack=[dict objectForKey:@"attack"];
        model.mana=[dict objectForKey:@"mana"];
        model.hitrate=[dict objectForKey:@"hitrate"];
        model.lv=[dict objectForKey:@"lv"];
        model.experience=[dict objectForKey:@"experience"];
        model.luck=[dict objectForKey:@"luck"];
        model.crit=[dict objectForKey:@"crit"];
        model.miss=[dict objectForKey:@"miss"];
    }
    return model;
}
@end
