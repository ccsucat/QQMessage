//
//  ViewController.m
//  01_QQ
//
//  Created by xubinbin on 2020/2/28.
//  Copyright © 2020 ccsu_cat. All rights reserved.
//

#import "ViewController.h"
#import "QQmessage.h"
#import "QQMessageFrame.h"
#import "QQMessageCell.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *messages;
@end

@implementation ViewController
-(NSMutableArray *)messages
{
    if (_messages == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:dictArray.count];
        //NSString *preTime = @"";
        for (NSDictionary *dict in dictArray) {
            QQmessage *message = [QQmessage messageWithDict:dict];
            
            //message.hiddenTime = [message.time isEqualToString:preTime];
            QQmessage *preMessage = (QQmessage *)[[arrayM lastObject] message];
            message.hiddenTime = [message.time isEqualToString:preMessage.time];
            QQMessageFrame *mFrame = [[QQMessageFrame alloc] init];
            mFrame.message = message;
            [arrayM addObject:mFrame];
            //preTime = message.time;
        }
        _messages = [arrayM copy];
    }
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.allowsSelection = NO;
    _tableView.delegate = self;
     //[self.view endEditing:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange) name:UIKeyboardWillChangeFrameNotification object:nil];
}
-(void)keyboardWillChange
{
    NSLog(@"hello world");
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"count = %lu", self.messages.count);
    return self.messages.count;
}
-(CGFloat)tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QQMessageFrame *mFrame = self.messages[indexPath.row];
    NSLog(@"----height = %f", mFrame.cellHeight);
    return mFrame.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    QQMessageCell *cell = [QQMessageCell cellWithTableView:tableView];
    QQMessageFrame *mFrame = self.messages[indexPath.row];
    cell.mFrame = mFrame;
    NSLog(@"-----2");
    return cell;
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
