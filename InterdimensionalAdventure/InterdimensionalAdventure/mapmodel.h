//
//  mapmodel.h
//  InterdimensionalAdventure
//
//  Created by neuedu on 15/10/13.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mapmodel : NSObject
@property(nonatomic,copy)NSNumber*num;
+(instancetype)mapWithDict:(NSDictionary * )dict;
@end
