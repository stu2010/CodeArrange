//
//  NSString+util.h
//  code小品
//
//  Created by flk on 16/9/23.
//  Copyright © 2016年 flk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (util)

//AES256 加密 / 解密
- (NSString *)AES256EncryptStringWithKey:(NSString *)key ;
- (NSString *)AES256DecryptStringWithKey:(NSString *)key ;

//UUID
+ (NSString *)UUIDString ;

- (NSString *)MD5;
- (NSString *)SHA256;

@end
