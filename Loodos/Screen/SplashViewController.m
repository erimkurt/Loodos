//
//  SplashViewController.m
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self isReachable];
}

-(void)setUpUI{
    self.reachabilityButton.hidden = YES;
    self.reachabilityButton.titleLabel.text = NSLocalizedString(@"TryAgain", nil);
}

-(void)isReachable{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        bool isReachable = [[AFNetworkReachabilityManager sharedManager] isReachable];
        if(isReachable){
            self.titleLabel.text = NSLocalizedString(@"YES", nil);
            self.reachabilityButton.hidden = YES;
        }else{
            self.titleLabel.text = NSLocalizedString(@"NoConnection", nil);
            self.reachabilityButton.hidden = NO;
        }
    }];
}
    
- (IBAction)checkReachability:(id)sender {
    [self isReachable];
}
@end
