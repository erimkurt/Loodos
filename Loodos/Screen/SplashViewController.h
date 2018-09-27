//
//  SplashViewController.h
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *reachabilityButton;
- (IBAction)checkReachability:(id)sender;

@end

