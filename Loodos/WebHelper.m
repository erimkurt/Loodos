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

#pragma mark - Search content
-(void)getSearchContent:(NSString*)searchString successBlock:(APISuccessBlock)successBlock errorBlock:(APISuccessBlock)errorBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://www.omdbapi.com/?apikey=5fc8e67e&s=star&page=1" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        successBlock([self convertJSONToString:responseObject]);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        errorBlock(error);
    }];
}

-(NSString*)convertJSONToString:(id)json{
    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end
