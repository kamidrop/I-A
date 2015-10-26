//
//  monsterModel.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/10/19.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface monsterModel : NSObject
@property(nonatomic,copy)NSNumber* miss;
@property(nonatomic,copy)NSNumber* Crit;
@property(nonatomic,copy)NSNumber* Experience;
@property(nonatomic,copy)NSNumber* Hitrate;
@property(nonatomic,copy)NSNumber* Attack;
@property(nonatomic,copy)NSNumber* shield;
@property(nonatomic,copy)NSNumber* hp;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* pic;
@property(nonatomic,copy)NSString* Figure;
@property(nonatomic,copy)NSString* text;
@property(nonatomic,copy)NSNumber* num;
+(instancetype)mosterModelWithDict:(NSDictionary*)dict;
@end
