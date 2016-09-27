//
//  NSString+util.m
//  code小品
//
//  Created by flk on 16/9/23.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "NSString+util.h"
#import <CommonCrypto/CommonDigest.h>
#import "EncryptionUtil.h"
#import "Base64.h"

@implementation NSString (util)

- (NSString *)AES256EncryptStringWithKey:(NSString *)key {
    NSData *plain = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *secret = [plain AES256EncryptDataWithKey:key];
    if (secret == nil) {
        return nil;
    }
    NSString *secretString = [Base64 encode:secret];
    return secretString;
}

- (NSString *)AES256DecryptStringWithKey:(NSString *)key {
    NSData *secret = [Base64 decode:self];
    NSData *plain = [secret AES256DecryptDataWithKey:key];
    if (plain == nil) {
        return nil;
    }
    NSString *plainString = [[NSString alloc] initWithData:plain encoding:NSUTF8StringEncoding];
    return plainString;
}

// UUID 生成
+ (NSString *)UUIDString {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    NSString *s = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
    if(uuid) {
        CFRelease(uuid);
    }
    return s;
}


- (NSString *)MD5 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([data bytes], (CC_LONG)[data length], result);
    
    return [NSString
            stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1],
            result[2], result[3],
            result[4], result[5],
            result[6], result[7],
            result[8], result[9],
            result[10], result[11],
            result[12], result[13],
            result[14], result[15]
            ];
}

- (NSString *)SHA256 {
    const char *cstr = [self UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(cstr, (CC_LONG)strlen(cstr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return [NSString stringWithString:ret];
}

@end
