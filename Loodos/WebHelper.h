//
//  WebHelper.h
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ APISuccessBlock)(id result);
@interface WebHelper : NSObject
@property(nonatomic, strong) NSString* path;
@property(nonatomic, strong) NSString* apiKey;
+ (WebHelper *) sharedInstance;

#pragma mark - Search content
-(void)getSearchContent:(NSString*)searchString successBlock:(APISuccessBlock)successBlock errorBlock:(APISuccessBlock)errorBlock;
@end
