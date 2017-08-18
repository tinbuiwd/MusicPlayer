//
//  AlbumData.m
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import "AlbumData.h"

@implementation AlbumData

- (NSUInteger) totalTracks {
    return self.tracks.count;
}

-(instancetype)initWithTitle:(NSString*)title
                        year:(NSString*)year
                filenameBase:(NSString*)filenameBase {
    
    _title = title;
    _year  = year;
    _filenameBase = filenameBase;
    
    
    _filenameForAlbumimage  = [filenameBase stringByAppendingString:@".002.jpg"];
    
    
    _tracks = [self fetchTracksFor:title];
    
    return self;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"(%@) %@", self.year, self.title];
}

- (NSString *)fetchTracksFor:(NSString*)albumTitle {
    
    NSArray *pop            = @[@"Anh thế giới và em",
                                @"We don’t talk any more",
                                @"Chuyện của mùa đông",
                                @"Đi rồi sẽ đến",
                                @"Sorry",
                                @"Những ngày vô đời",
                                @"Yêu Xa"];
    
    NSArray *symphony      = @[@"As you wish",
                               @"Dream a litter dream of me",
                               @"It's your day",
                               @"Kiss the rain",
                               @"Love me",
                               @"May be",
                               @"Passing by",
                               @"Spring time",
                               @"When The Love Falls"];
    
    NSArray *rock          = @[@"Despacito",
                               @"Uptown Funk",
                               @"Sugar",
                               @"Wrecking Ball"];
    
    NSArray *ballad        = @[@"Yêu",
                               @"Hôn Anh",
                               @"Lạ Lùng"];
    
    NSArray *jazz          = @[@"Superstar",
                               @"The winner takes it all",
                               @"Jambalaya",
                               @"Top of the world",
                               @"Yesterday once more"];
    
    NSArray *country       = @[@"Whiskey Lullaby",
                               @"She is everything",
                               @"Remind me"];

    
    NSDictionary *allTracks = @{
                                @"Pop"     : pop,
                                @"Symphony": symphony,
                                @"Rock"    : rock,
                                @"Ballad"  : ballad,
                                @"Jazz"    : jazz,
                                @"Country" : country
                                };
    
    return [allTracks objectForKey: albumTitle];
}

@end
