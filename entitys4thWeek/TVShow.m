//
//  TVShows.m
//  entitys4thWeek
//
//  Created by Miguel Santiago Rodríguez on 23/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "TVShow.h"

NSString *const nameField = @"name";
NSString *const summaryField = @"summary";
NSString *const creatorField = @"creator";
NSString *const castField = @"cast";
NSString *const ratingField = @"rating";
NSString *const imageField = @"image";

@implementation TVShow


@end

@implementation TVShow(NSCoding)

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (show) {
        self.name = [aDecoder decodeObjectForKey:nameField];
        self.summary = [aDecoder decodeObjectForKey:summaryField];
        self.creator = [aDecoder decodeObjectForKey:creatorField];
        self.cast = [aDecoder decodeObjectForKey:castField];
        self.image = [aDecoder decodeObjectForKey:imageField];
        self.rating = [aDecoder decodeFloatForKey:ratingField];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:nameField];
    [aCoder encodeObject:self.summary forKey:summaryField];
    [aCoder encodeObject:self.creator forKey:creatorField];
    [aCoder encodeObject:self.cast forKey:castField];
    [aCoder encodeObject:self.image forKey:imageField];
    [aCoder encodeFloat:self.rating forKey:ratingField];
}

@end

@implementation TVShow(NSCopying)

- (id)copyWithZone:(NSZone *)zone {
    TVShow *show = [[TVShow allocWithZone:zone] init];
    
    if (show) {
        show.showId = [self.name copyWithZone:zone];
        show.name = [self.name copyWithZone:zone];
        show.summary = [self.summary copyWithZone:zone];
        show.creator = [self.creator copyWithZone:zone];
        show.cast = [self.cast copyWithZone:zone];
        show.image = [self.image copyWithZone:zone];
        show.rating = self.rating;
    }
    
    return show;
}

@end
