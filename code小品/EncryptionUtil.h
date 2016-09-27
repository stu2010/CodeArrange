//
//  EncryptionUtil.h
//  issms
//
//  Created by Chi Zhang on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>

extern NSData *AES256Decrypt(const void *bytes, size_t len, NSString *key);
extern NSData *AES256Encrypt(const void *bytes, size_t len, NSString *key);


@interface NSData (EncryptionUtil)
- (NSData *)AES256EncryptDataWithKey:(NSString *)key;
- (NSData *)AES256DecryptDataWithKey:(NSString *)key;
@end


