# MKAlertController

[![Travis](https://img.shields.io/travis/mk2016/MKAlertController.svg?style=flat)](https://travis-ci.org/mk2016/MKAlertController)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/MKAlertController.svg)](http://cocoadocs.org/docsets/MKAlertController)
[![CocoaPods](https://img.shields.io/dub/l/vibe-d.svg)](https://raw.githubusercontent.com/mk2016/MKAlertController/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/MKAlertController.svg)](http://cocoadocs.org/docsets/MKAlertController)
[![MKDev](https://img.shields.io/badge/blog-MK-brightgreen.svg)](https://mk2016.github.io/)

#### 效果图
![image](https://github.com/mk2016/MKAlertController/raw/master/Screenshots/domeGif.gif)

#### 添加
* cocoapods  
pod 'MKAlertController', '~> 1.0.0'

* Manually (手动导入)  
只需将 MKAlertController 文件添加到项目中即可

#### 用法 详细用法参见demo
```
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
```

#### 利用OC的runtime 动态修改系统自带的UIAlertController。自定义样式。

## License
MIT License

Copyright (c) 2017 MK Shaw

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
