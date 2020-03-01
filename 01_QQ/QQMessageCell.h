//
//  QQMessageCell.h
//  01_QQ
//
//  Created by xubinbin on 2020/2/28.
//  Copyright © 2020 ccsu_cat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQmessage, QQMessageFrame;
@interface QQMessageCell : UITableViewCell

+(instancetype) cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) QQMessageFrame *mFrame;
@end

