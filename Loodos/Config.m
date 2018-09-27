//
//  Config.m
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "Config.h"

@implementation Config
+ (Config *) sharedInstance
{
    static Config *_instance;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _instance = [[self alloc] init];
        _instance.nameString = @"";
        [_instance setupConfig];
    });
    return _instance;
}

-(void)setupConfig{
    self.remoteConfig = [FIRRemoteConfig remoteConfig];
    FIRRemoteConfigSettings *remoteConfigSettings = [[FIRRemoteConfigSettings alloc] initWithDeveloperModeEnabled:YES];
    self.remoteConfig.configSettings = remoteConfigSettings;
}

#pragma mark - Config Fetch
-(void)getConfig:(void (^)(bool isSuccess))block{
    [self.remoteConfig fetchWithExpirationDuration:0 completionHandler:^(FIRRemoteConfigFetchStatus status, NSError *error) {
        if (status == FIRRemoteConfigFetchStatusSuccess) {
            [self.remoteConfig activateFetched];
            FIRRemoteConfigValue *remoteValue = [self.remoteConfig configValueForKey:AppNameConfigKeyName];
            self.nameString = remoteValue.stringValue;
            
            block(YES);
        } else {
            NSLog(@"Error %@", error.localizedDescription);
            block(NO);
        }
    }];
}
@end
