//
//  ContentDetail.h
//  Loodos
//
//  Created by macbookair on 29.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "JSONModel.h"
#import "ContentRating.h"

@interface ContentDetail : JSONModel
@property (nonatomic) NSString *Title;
@property (nonatomic) NSString *Year;
@property (nonatomic) NSString *Rated;
@property (nonatomic) NSString *Released;
@property (nonatomic) NSString *Runtime;
@property (nonatomic) NSString *Genre;
@property (nonatomic) NSString *Director;
@property (nonatomic) NSString *Writer;
@property (nonatomic) NSString *Actors;
@property (nonatomic) NSString *Plot;
@property (nonatomic) NSString *Language;
@property (nonatomic) NSString *Country;
@property (nonatomic) NSString *Awards;
@property (nonatomic) NSString *Poster;
@property (strong, nonatomic) NSArray <ContentRating> *Ratings;
@property (nonatomic) NSString *Metascore;
@property (nonatomic) NSString *imdbRating;
@property (nonatomic) NSString *imdbVotes;
@property (nonatomic) NSString *imdbID;
@property (nonatomic) NSString *Type;
@property (nonatomic) NSString *DVD;
@property (nonatomic) NSString *BoxOffice;
@property (nonatomic) NSString *Production;
@property (nonatomic) NSString *Website;
@property (nonatomic) NSString *Response;
@end
