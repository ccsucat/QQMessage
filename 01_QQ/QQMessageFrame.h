//
//  QQMessageFrame.h
//  01_QQ
//
//  Created by xubinbin on 2020/2/28.
//  Copyright © 2020 ccsu_cat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class QQmessage;
#define TextFont [UIFont systemFontOfSize:18]
#define QQMessageEdgeInsetsWidth 20
@interface QQMessageFrame : NSObject
@property (nonatomic, strong) QQmessage *message;


@property (nonatomic, assign) CGRect timeF;
@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGRect textF;
@property (nonatomic, assign) CGFloat cellHeight;


@end

