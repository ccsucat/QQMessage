//
//  QQmessage.h
//  01_QQ
//
//  Created by xubinbin on 2020/2/28.
//  Copyright © 2020 ccsu_cat. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    MessageModelToMe = 0,
    MessageModelToOther
} MessageMpdelType;
@interface QQmessage : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) BOOL hiddenTime;
@property (nonatomic, assign) MessageMpdelType type;
-(instancetype) initWithDict:(NSDictionary *) dict;
+(instancetype) messageWithDict:(NSDictionary *) dict;
@end

