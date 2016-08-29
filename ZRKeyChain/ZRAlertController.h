//
//  ZRAlertController.h
//  ZRAlertController
//
//  Created by Victor John on 16/1/10.
//  Copyright (c) 2016年 XiaoRuiGeGeStudio. All rights reserved.
//
//  https://github.com/VictorZhang2014/ZRAlertController
//  An open source library for iOS in Objective-C that is being compatible with iOS 7.0 and later.
//  Its main function that wrapped UIAlertView and UIAlertController that are easier to call.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger){
    ZRAlertStylePlainTextInput,
    ZRAlertStyleSecureTextInput,
    ZRAlertStyleLoginAndPasswordInput
}ZRAlertStyle;


typedef void(^  _Nullable AlertBlock)(void);
typedef void(^  _Nullable AlertBlock1)(UITextField *textFiled);
typedef void(^  _Nullable AlertBlock2)(UITextField *textFiled1, UITextField *textFiled2);
typedef void(^ActionBlock)(int index, NSString *item);

@interface ZRAlertController : NSObject

+ (instancetype)defaultAlert;


/*
 * Alert View
 **/
- (void)alertShow:(UIViewController *)controller title:(NSString * _Nullable)title message:(NSString *)message okayButton:(NSString *)okay completion:(void(^ _Nullable)())completion NS_DEPRECATED_IOS(7_0, 9_0);

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message okayButton:(NSString *)okay completion:(void(^ _Nullable)())completion NS_AVAILABLE_IOS(7_0);

- (void)alertShow:(UIViewController *)controller title:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay okayHandler:(AlertBlock)okayHandler cancelHandler:(AlertBlock)cancelHandler NS_DEPRECATED_IOS(7_0, 9_0);

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay okayHandler:(AlertBlock)okayHandler cancelHandler:(AlertBlock)cancelHandler NS_AVAILABLE_IOS(7_0);

- (void)alertShow:(UIViewController *)controller title:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay alertStyle:(ZRAlertStyle)style placeHolder:(NSString *)placeHolder okayHandler:(AlertBlock1)okayHandler cancelHandler:(AlertBlock1)cancelHandler NS_DEPRECATED_IOS(7_0, 9_0);

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay alertStyle:(ZRAlertStyle)style placeHolder:(NSString *)placeHolder okayHandler:(AlertBlock1)okayHandler cancelHandler:(AlertBlock1)cancelHandler NS_AVAILABLE_IOS(7_0);

- (void)alertShow:(UIViewController *)controller title:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay alertStyle:(ZRAlertStyle)style placeHolder1:(NSString *)placeHolder1 placeHolder2:(NSString *)placeHolder2 sureHandler:(AlertBlock2)okayHandler abolishHandler:(AlertBlock2)cancelHandler NS_DEPRECATED_IOS(7_0, 9_0);

- (void)alertShowWithTitle:(NSString * _Nullable)title message:(NSString *)message cancelButton:(NSString *)cancel okayButton:(NSString *)okay alertStyle:(ZRAlertStyle)style placeHolder1:(NSString *)placeHolder1 placeHolder2:(NSString *)placeHolder2 sureHandler:(AlertBlock2)okayHandler abolishHandler:(AlertBlock2)cancelHandler NS_AVAILABLE_IOS(7_0);



/*
 * Action Sheet
 **/
- (void)actionView:(UIViewController *)viewController title:(NSString * _Nullable)title cancel:(NSString *)cancel others:(NSArray *)others handler:(ActionBlock)handler NS_DEPRECATED_IOS(7_0, 9_0);

- (void)actionViewWithTitle:(NSString * _Nullable)title cancel:(NSString *)cancel others:(NSArray *)others handler:(ActionBlock)handler NS_AVAILABLE_IOS(7_0);

@end

NS_ASSUME_NONNULL_END



