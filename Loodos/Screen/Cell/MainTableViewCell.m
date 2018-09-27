//
//  MainTableViewCell.m
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.typeView layerViewRadius:5.0];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setupCell{
    self.contentNameLabel.text = self.content.Title;
    self.contentYearLabel.text = self.content.Year;
    self.contentTypeLabel.text = self.content.Type;
    [self.imageCover sd_setImageWithURL:[NSURL URLWithString:self.content.Poster]
                       placeholderImage:[UIImage imageNamed:@"placeHolder"]];
}

@end
