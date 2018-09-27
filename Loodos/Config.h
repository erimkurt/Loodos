//
//  Config.h
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import <Foundation/Foundation.h>
@import FirebaseRemoteConfig;

@interface Config : NSObject
@property(nonatomic, strong) FIRRemoteConfig *remoteConfig;
@property(nonatomic, strong) NSString *nameString;
+ (Config *) sharedInstance;

- (void)getConfig:(void (^)(bool isSuccess))block;
@end
