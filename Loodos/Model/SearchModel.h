//
//  SearchModel.h
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "JSONModel.h"
#import "ContentPreview.h"

@interface SearchModel : JSONModel
@property (strong, nonatomic) NSArray <ContentPreview> *Search;
@property (nonatomic) NSString *totalResults;
@property (nonatomic) NSString *Response;
@end
