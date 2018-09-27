//
//  WebHelper.m
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "WebHelper.h"

@implementation WebHelper
+ (WebHelper *) sharedInstance
{
    static WebHelper *_instance;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _instance = [[self alloc] init];
        #ifdef DEBUG
            //Debug Services
            _instance.path = @"http://www.omdbapi.com/";
        #else
            //Release Services
            _instance.path = @"";
        #endif
        _instance.apiKey = @"5fc8e67e";
    });
    return _instance;
}

@end
