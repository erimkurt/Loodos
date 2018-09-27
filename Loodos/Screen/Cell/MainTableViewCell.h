//
//  MainTableViewCell.h
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property (nonatomic) ContentPreview *content;
@property (weak, nonatomic) IBOutlet UIImageView *imageCover;
@property (weak, nonatomic) IBOutlet UILabel *contentYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentTypeLabel;
@property (weak, nonatomic) IBOutlet UIView *typeView;

-(void)setupCell;
@end
