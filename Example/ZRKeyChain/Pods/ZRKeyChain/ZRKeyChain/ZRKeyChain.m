//
//  ZRKeyChain.m
//  ZRKeyChain
//
//  Created by Victor Zhang on 8/26/16.
//  Copyright © 2016 XiaoRuiGeGe. All rights reserved.
//
//  https://github.com/VictorZhang2014/ZRKeyChain
//  A keychain library for storing accounts and passwords and sharing data between multiple applications in Objective-C.
//

#import "ZRKeyChain.h"

@implementation ZRKeyChain

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service account:(NSString *)account {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            service, (__bridge_transfer id)kSecAttrService,
            account, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+ (void)saveKeychain:(NSString *)service account:(NSString *)account data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service account:account];
    //Delete old item before add new item
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //Add item to keychain with the search dictionary
    OSStatus status = SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
    if (status != errSecSuccess) {
        NSString *des = [[self class] keychainError:status];
        NSLog(@"saveKeychain of %@ failed: %@", service, des);
    }
}

+ (id)loadKeychain:(NSString *)service account:(NSString*)account {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service account:account];
    //Configure the search setting
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    OSStatus status = SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData);
    if (status == errSecSuccess) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    } else {
        NSString *des = [[self class] keychainError:status];
        NSLog(@"loadKeychain of %@ failed: %@", service, des);
    }
    
    return ret;
}

+ (void)deleteKeychain:(NSString *)service account:(NSString *)account {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service account:account];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}

+ (NSString *)keychainError:(OSStatus)status {
    switch (status) {
        case errSecSuccess:
            return @"No error.";
        case errSecUnimplemented:
            return @"Function or operation not implemented.";
        case errSecIO:
            return @"I/O error (bummers)";
        case errSecOpWr:
            return @"file already open with with write permission";
        case errSecParam:
            return @"One or more parameters passed to a function where not valid.";
        case errSecAllocate:
            return @"Failed to allocate memory.";
        case errSecUserCanceled:
            return @"User canceled the operation.";
        case errSecBadReq:
            return @"Bad parameter or invalid state for operation.";
        case errSecInternalComponent:
            return @"errSecInternalComponent";
        case errSecNotAvailable:
            return @"No keychain is available. You may need to restart your computer. ";
        case errSecDuplicateItem:
            return @"The specified item already exists in the keychain.";
        case errSecItemNotFound:
            return @"The specified item could not be found in the keychain. ";
        case errSecInteractionNotAllowed:
            return @"User interaction is not allowed.";
        case errSecDecode:
            return @"Unable to decode the provided data.";
        case errSecAuthFailed:
            return @"The user name or passphrase you entered is not correct.";
        default:
            break;
    }
    return @"No error.";
}

@end
