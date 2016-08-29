//
//  ZRKeyChain.h
//  ZRKeyChain
//
//  Created by Victor Zhang on 8/26/16.
//  Copyright © 2016 XiaoRuiGeGe. All rights reserved.
//
//  https://github.com/VictorZhang2014/ZRKeyChain
//  A keychain library for storing accounts and passwords and sharing data between multiple applications in Objective-C.
//

#import <Foundation/Foundation.h>

@interface ZRKeyChain : NSObject

+ (void)saveKeychain:(NSString *)service account:(NSString *)account data:(id)data;

+ (id)loadKeychain:(NSString *)service account:(NSString *)account;

+ (void)deleteKeychain:(NSString *)service account:(NSString *)account;

@end
