//
//  QQmessage.m
//  01_QQ
//
//  Created by xubinbin on 2020/2/28.
//  Copyright © 2020 ccsu_cat. All rights reserved.
//

#import "QQmessage.h"

@implementation QQmessage
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)messageWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
