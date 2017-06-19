//
//  ViewController.m
//  MKAlertController
//
//  Created by xmk on 2017/6/19.
//  Copyright © 2017年 mk. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+MKAdd.h"

#define MKSCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define MKSCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasArray = @[].mutableCopy;
    [self.datasArray addObject:@"system default style"];
    [self.datasArray addObject:@"system only title"];
    
    [self.datasArray addObject:@"only title"];
    [self.datasArray addObject:@"only message"];
    [self.datasArray addObject:@"custom style"];
    
    
    [self.datasArray addObject:@"Category setupUI alert"];
    [self.datasArray addObject:@"Category setupUI actionSheet"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MKSCREEN_WIDTH, MKSCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.datasArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{
            UIAlertController *ac = [UIAlertController mk_alertWithTitle:@"title" message:@"message" cancelTitle:@"取消" confirmTitle:@"确定" preferredStyle:UIAlertControllerStyleAlert block:^(NSInteger buttonIndex) {
                NSLog(@"button index : %zd", buttonIndex);
            }];
            [self presentViewController:ac animated:YES completion:nil];
            
        }
            break;
        case 1:{
            UIAlertController *ac = [UIAlertController mk_alertWithTitle:@"this is a loooooooooooooong title" message:nil buttonTitles:@[@"button0",@"button1"] preferredStyle:UIAlertControllerStyleAlert block:^(NSInteger buttonIndex) {
                NSLog(@"button index : %zd", buttonIndex);
            }];
            [self presentViewController:ac animated:YES completion:nil];
            break;
        }
            
        case 2:{
            
            MKAlertCtrlConfig *config = [[MKAlertCtrlConfig alloc] init];
            config.titleFont = [UIFont systemFontOfSize:24];
            config.titleColor = [UIColor grayColor];
            config.titleAlignment = NSTextAlignmentCenter;
            UIAlertController *ac = [UIAlertController mk_alertWithTitle:@"this is a loooooooooooooooooooong title \n& message is nil" message:nil cancelTitle:@"取消" confirmTitle:@"确认" preferredStyle:UIAlertControllerStyleAlert config:config block:^(NSInteger buttonIndex) {
                NSLog(@"button index : %zd", buttonIndex);
            }];
            [self presentViewController:ac animated:YES completion:nil];
            break;
        }
        case 3:{
            MKAlertCtrlConfig *config = [[MKAlertCtrlConfig alloc] init];
            config.messageFont = [UIFont systemFontOfSize:14];
            config.messageColor = [UIColor orangeColor];
            config.messageAlignment = NSTextAlignmentLeft;
            UIAlertController *ac = [UIAlertController mk_alertWithTitle:nil message:@"this is a message \n& title is nil \n& NSTextAlignmentLeft" preferredStyle:UIAlertControllerStyleAlert config:config block:^(NSInteger buttonIndex) {
                NSLog(@"button index : %zd", buttonIndex);
            } buttonTitles:@"button0",@"button1", nil];
            [self presentViewController:ac animated:YES completion:nil];
            break;
        }
        case 4:{
            MKAlertCtrlConfig *config = [[MKAlertCtrlConfig alloc] init];
            config.titleFont = [UIFont systemFontOfSize:30];
            config.titleColor = [UIColor greenColor];
            config.messageFont = [UIFont systemFontOfSize:12];
            config.messageColor = [UIColor redColor];
            config.messageAlignment = NSTextAlignmentLeft;
            config.actionColor = [UIColor lightGrayColor];
            config.destructivelColor = [UIColor purpleColor];
            config.cancelIndex = 2;
            config.destructiveIndex = 3;
            UIAlertController *ac = [UIAlertController mk_alertWithTitle:@"title" message:@"message:\n1.xxxxxxx\n2.yyyyyyy\n3.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" buttonTitles:@[@"button0",@"button1",@"cancel2",@"destructive3",@"button4"] preferredStyle:UIAlertControllerStyleAlert config:config block:^(NSInteger buttonIndex) {
                NSLog(@"button index : %zd", buttonIndex);
            }];
            [self presentViewController:ac animated:YES completion:nil];
            break;
        }
        case 5:{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message:\n1.xxxxxxx\n2.yyyyyyy\n3.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action0" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"0");
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"1");
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"2");
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action3" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"3");
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action4" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"4");
            }]];
            
            MKAlertCtrlConfig *config = [[MKAlertCtrlConfig alloc] init];
            config.titleFont = [UIFont systemFontOfSize:30];
            config.titleColor = [UIColor greenColor];
            config.messageFont = [UIFont systemFontOfSize:12];
            config.messageColor = [UIColor redColor];
            config.messageAlignment = NSTextAlignmentLeft;
            config.actionColor = [UIColor lightGrayColor];
            config.destructivelColor = [UIColor purpleColor];
            config.destructiveIndex = 3;
            [alertController mk_setCustomStyleWith:config];
            //            [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            //                textField.font = [UIFont systemFontOfSize:30];
            //                textField.placeholder = @"xxx";
            //            }];
            //            [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            //                textField.font = [UIFont systemFontOfSize:30];
            //                textField.placeholder = @"222";
            //            }];
            [self presentViewController:alertController animated:YES completion:nil];
            break;
        }
        case 6:{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message:\n1.xxxxxxx\n2.yyyyyyy\n3.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" preferredStyle:UIAlertControllerStyleActionSheet];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action0" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"0");
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"1");
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"2");
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"action3" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"3");
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"4");
            }]];
            
            MKAlertCtrlConfig *config = [[MKAlertCtrlConfig alloc] init];
            config.titleFont = [UIFont systemFontOfSize:30];
            config.titleColor = [UIColor greenColor];
            config.messageFont = [UIFont systemFontOfSize:12];
            config.messageColor = [UIColor redColor];
            config.messageAlignment = NSTextAlignmentLeft;
            config.actionColor = [UIColor lightGrayColor];
            config.destructivelColor = [UIColor purpleColor];
            config.destructiveIndex = 3;
            [alertController mk_setCustomStyleWith:config];
            [self presentViewController:alertController animated:YES completion:nil];
        }
        default:
            break;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
