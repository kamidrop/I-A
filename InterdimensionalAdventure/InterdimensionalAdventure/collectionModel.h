//
//  collectionModel.h
//  collection
//
//  Created by neuedu on 15/8/14.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface collectionModel : NSObject
@property(nonatomic,copy)NSString* Pic;
@property(nonatomic,copy)NSString* Figure;
@property(nonatomic,copy)NSString* Text;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSNumber* hp;
@property(nonatomic,copy)NSNumber* mp;
@property(nonatomic,copy)NSNumber* shield;
@property(nonatomic,copy)NSNumber*power;
@property(nonatomic,copy)NSNumber*wisdom;
@property(nonatomic,copy)NSNumber*skill;
@property(nonatomic,copy)NSNumber*corporeity;
@property(nonatomic,copy)NSNumber*attack;
@property(nonatomic,copy)NSNumber*mana;
@property(nonatomic,copy)NSNumber*hitrate;
@property(nonatomic,copy)NSNumber*lv;
@property(nonatomic,copy)NSNumber*experience;
@property(nonatomic,copy)NSNumber*luck;
@property(nonatomic,copy)NSNumber*crit;
@property(nonatomic,copy)NSNumber*miss;
+(instancetype)collectionModelWithDict:(NSDictionary * )dict;
@end
