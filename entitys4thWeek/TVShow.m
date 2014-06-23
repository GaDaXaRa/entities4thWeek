//
//  TVShows.m
//  entitys4thWeek
//
//  Created by Miguel Santiago Rodríguez on 23/06/14.
//  Copyright (c) 2014 ironhack. All rights reserved.
//

#import "TVShow.h"

NSString *const showIdField = @"showId";
NSString *const nameField = @"name";
NSString *const summaryField = @"summary";
NSString *const creatorField = @"creator";
NSString *const castField = @"cast";
NSString *const imageField = @"image";
NSString *const ratingField = @"rating";

@implementation TVShow

#pragma mark -
#pragma mark Equality

- (BOOL)isEqualToTVShow:(TVShow *)show {
    return [self.showId isEqualToString:show.showId];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[TVShow class]]) {
        return NO;
    }
    
    return [self isEqualToTVShow:object];
}

- (NSUInteger)hash {
    return [_showId hash];
}

@end

@implementation TVShow(NSCoding)

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.showId = [aDecoder decodeObjectForKey:showIdField];
        self.name = [aDecoder decodeObjectForKey:nameField];
        self.summary = [aDecoder decodeObjectForKey:summaryField];
        self.creator = [aDecoder decodeObjectForKey:creatorField];
        self.cast = [aDecoder decodeObjectForKey:castField];
        self.image = [aDecoder decodeObjectForKey:imageField];
        
        NSNumber *ratingNumber = [aDecoder decodeObjectForKey:ratingField];
        self.rating = CGFLOAT_IS_DOUBLE ? [ratingNumber doubleValue] : [ratingNumber floatValue];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    if (self.showId) [aCoder encodeObject:self.showId forKey:showIdField];
    if (self.name) [aCoder encodeObject:self.name forKey:nameField];
    if (self.summary) [aCoder encodeObject:self.summary forKey:summaryField];
    if (self.creator) [aCoder encodeObject:self.creator forKey:creatorField];
    if (self.cast) [aCoder encodeObject:self.cast forKey:castField];
    if (self.image) [aCoder encodeObject:self.image forKey:imageField];
    
    NSNumber *ratingNumber = CGFLOAT_IS_DOUBLE ? [NSNumber numberWithDouble:self.rating] : [NSNumber numberWithFloat:self.rating];
    
    [aCoder encodeObject:ratingNumber forKey:ratingField];
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
