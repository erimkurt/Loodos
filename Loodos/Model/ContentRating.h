//
//  ContentRating.h
//  Loodos
//
//  Created by macbookair on 29.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//
@protocol ContentRating
@end

@interface ContentRating : JSONModel
@property (nonatomic) NSString *Source;
@property (nonatomic) NSString *Value;
@end
