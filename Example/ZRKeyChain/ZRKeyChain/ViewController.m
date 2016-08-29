//
//  ViewController.m
//  ZRKeyChain
//
//  Created by Victor Zhang on 8/29/16.
//  Copyright © 2016 XiaoRuiGeGe. All rights reserved.
//

#import "ViewController.h"
#import <ZRKeyChain/ZRKeyChain.h>


NSString * const KEYCHAIN_SERVICE_NAME = @"com.xiaoruigege.app.keychain";
NSString * const KEY_USERNAME1 = @"com.xiaoruigege.app.username1";
NSString * const KEY_USERNAME2 = @"com.xiaoruigege.app.username2";
NSString * const KEY_PASSWORD1 = @"com.xiaoruigege.app.password1";
NSString * const KEY_PASSWORD2 = @"com.xiaoruigege.app.password2";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZRKeyChain saveKeychain:KEYCHAIN_SERVICE_NAME account:KEY_USERNAME1 data:KEY_PASSWORD1];
    [ZRKeyChain saveKeychain:KEYCHAIN_SERVICE_NAME account:KEY_USERNAME2 data:KEY_PASSWORD2];
    
    
    
    id value1 = [ZRKeyChain loadKeychain:KEYCHAIN_SERVICE_NAME account:KEY_USERNAME1];
    id value2 = [ZRKeyChain loadKeychain:KEYCHAIN_SERVICE_NAME account:KEY_USERNAME2];
    
    NSLog(@"value1: %@, value2: %@", value1, value2);
    
}


@end
