//
//  TVShows.h
//  entitys4thWeek
//
//  Created by Miguel Santiago Rodríguez on 23/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const nameField;
FOUNDATION_EXPORT NSString *const summaryField;
FOUNDATION_EXPORT NSString *const creatorField;
FOUNDATION_EXPORT NSString *const castField;
FOUNDATION_EXPORT NSString *const ratingField;
FOUNDATION_EXPORT NSString *const imageField;

@interface TVShow : NSObject<NSCopying, NSCoding>

@property (copy, nonatomic) NSString *showId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *summary;
@property (assign, nonatomic) CGFloat rating;
@property (copy, nonatomic) NSString *creator;
@property (copy, nonatomic) NSArray *cast;
@property (copy, nonatomic) NSString *image;

@end
