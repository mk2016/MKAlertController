//
//  UIAlertController+MKAdd.h
//  MKAlertView
//
//  Created by xmk on 2017/6/16.
//  Copyright © 2017年 mk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKAlertCtrlConfig;
@interface UIAlertController (MKAdd)

#pragma mark - ***** system style *****
+ (instancetype)mk_alertWithTitle:(NSString *)title
                          message:(NSString *)message
                   preferredStyle:(UIAlertControllerStyle)style
                            block:(void (^)(NSInteger buttonIndex))block
                     buttonTitles:(NSString *)cancelTitle, ... NS_REQUIRES_NIL_TERMINATION;

+ (instancetype)mk_alertWithTitle:(NSString *)title
                          message:(NSString *)message
                      cancelTitle:(NSString *)cancelTitle
                     confirmTitle:(NSString *)confirmTitle
                   preferredStyle:(UIAlertControllerStyle)style
                            block:(void (^)(NSInteger buttonIndex))block;

+ (instancetype)mk_alertWithTitle:(NSString *)title
                          message:(NSString *)message
                     buttonTitles:(NSArray *)buttonTitles
                   preferredStyle:(UIAlertControllerStyle)style
                            block:(void (^)(NSInteger buttonIndex))block;


#pragma mark - ***** custom style *****
+ (instancetype)mk_alertWithTitle:(NSString *)title
                          message:(NSString *)message
                   preferredStyle:(UIAlertControllerStyle)style
                           config:(MKAlertCtrlConfig *)config
                            block:(void (^)(NSInteger buttonIndex))block
                     buttonTitles:(NSString *)cancelTitle, ... NS_REQUIRES_NIL_TERMINATION;

+ (instancetype)mk_alertWithTitle:(NSString *)title
                          message:(NSString *)message
                      cancelTitle:(NSString *)cancelTitle
                     confirmTitle:(NSString *)confirmTitle
                   preferredStyle:(UIAlertControllerStyle)style
                           config:(MKAlertCtrlConfig *)config
                            block:(void (^)(NSInteger buttonIndex))block;

+ (instancetype)mk_alertWithTitle:(NSString *)title
                          message:(NSString *)message
                     buttonTitles:(NSArray *)buttonTitles
                   preferredStyle:(UIAlertControllerStyle)style
                           config:(MKAlertCtrlConfig *)config
                            block:(void (^)(NSInteger buttonIndex))block;

/** setup UI with config */
- (void)mk_setCustomStyleWith:(MKAlertCtrlConfig *)config;
@end



@interface MKAlertCtrlConfig : NSObject
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, assign) NSTextAlignment titleAlignment;
@property (nonatomic, strong) UIFont *messageFont;
@property (nonatomic, strong) UIColor *messageColor;
@property (nonatomic, assign) NSTextAlignment messageAlignment;
@property (nonatomic, strong) UIColor *actionColor;
@property (nonatomic, assign) NSInteger cancelIndex;
@property (nonatomic, assign) NSInteger destructiveIndex;
@property (nonatomic, strong) UIColor *destructivelColor;
@end
