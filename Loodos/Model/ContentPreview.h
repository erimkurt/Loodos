//
//  ContentPreview.h
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//
@protocol ContentPreview
@end

@interface ContentPreview : JSONModel
@property (nonatomic) NSString *Title;
@property (nonatomic) NSString *Year;
@property (nonatomic) NSString *imdbID;
@property (nonatomic) NSString *Type;
@property (nonatomic) NSString *Poster;
@end
