//
//  encryptionController.m
//  code小品
//
//  Created by flk on 16/9/26.
//  Copyright © 2016年 flk. All rights reserved.
//

#import "encryptionController.h"
#import "EncryptionUtil.h"
#import "NSString+util.h"

@interface encryptionController ()<UIDocumentInteractionControllerDelegate>
@property (nonatomic, strong) UIDocumentInteractionController *docInteractionController;

@end


@implementation encryptionController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //密话中的加密流程

    // 1 .通过一个方法 获取不同频道钥匙 globalKey / appStorageKey / userStorageKey (globalkey是MHKeymanger的单利懒加载，另外两个是类方法)
        //gGlobalKey = [self internalKeyForID:@"com.mihua.global-key" usingKey:MHInternalKey];

    // 2 .internalKeyForID 方法实现
        //根据传入的ID做Key ，去userdefault中找值 (default objectforkey)
            //如果没有 创建一个UUID字符串，用AES256加密存到userdefault中；
            //如果有，用AES256解密，返回uuid格式的字符串key.
    
    // 3. 在其他地方使用时,根据不同的key 使用ASE256加密／解密方法存储解析数据。
    

    [self ASE256test];
    
    [self base64test];
    
    [self MD5test];
    
    [self SHA256test];
    
    [self openfile];
}
-(void)ASE256test{

    NSString *str =@"jesfds";
    NSData *oragin =[str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *enc_data1 = [oragin AES256EncryptDataWithKey:@"key1"]; //加密1
    NSData *enc_data2 = [enc_data1 AES256EncryptDataWithKey:@"key2"]; // 加密2

    NSData *dec_data1 = [enc_data2 AES256DecryptDataWithKey:@"key2"];// 解密1
    NSData *dec_data2 = [dec_data1 AES256DecryptDataWithKey:@"key1"];// 解密2

    NSString *decroStr = [[NSString alloc]initWithData:dec_data2 encoding:NSUTF8StringEncoding];
    NSLog(@"----ASE256:%@",decroStr);
    
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
}

-(void)base64test{

    
}
// MD5 / SHA 属于散列算法 不可逆，一般情况下视为不可解密（）
-(void)MD5test{

    NSString *ss = @"你好";
    NSLog(@"----md5:%@",[ss MD5]);
}

-(void)SHA256test{
    
    NSString *ss = @"你好";
    NSLog(@"----SHA256:%@",[ss SHA256]);

    NSLog(@"hahah ");
    
    NSLog(@"回退之前的版本信息");
}

/////
-(void)openfile{
    
        NSURL *url = [NSURL URLWithString:@"sssss"];
        [self setupDocumentControllerWithURL:url];
        [self.docInteractionController presentOptionsMenuFromRect:CGRectMake(0, 20, 1500, 40) inView:self.view  animated:YES];

}

- (void)setupDocumentControllerWithURL:(NSURL *)url
{
    if (self.docInteractionController == nil){
        self.docInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        self.docInteractionController.delegate = self;
    }else{
        self.docInteractionController.URL = url;
    }
}
@end
