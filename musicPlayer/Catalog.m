//
//  Catalog.m
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import "Catalog.h"
#import "AlbumData.h"

@implementation Catalog
- (instancetype) init {
    self.albums = [self fetchAlbums];
    return self;
}
-(NSArray *) fetchAlbums {
    AlbumData *slow     = [[AlbumData alloc] initWithTitle:@"Pop"       year:@"Best 2017" filenameBase:@"pop"];
    AlbumData *symphony = [[AlbumData alloc] initWithTitle:@"Symphony"  year:@"Best 2017" filenameBase:@"symphony"];
    AlbumData *rock     = [[AlbumData alloc] initWithTitle:@"Rock"      year:@"Best 2017" filenameBase:@"rock"];
    AlbumData *ballad   = [[AlbumData alloc] initWithTitle:@"Ballad"    year:@"Best 2017" filenameBase:@"ballad"];
    AlbumData *jazz     = [[AlbumData alloc] initWithTitle:@"Jazz"      year:@"Best 2017" filenameBase:@"jazz"];
    AlbumData *country  = [[AlbumData alloc] initWithTitle:@"Country"   year:@"Best 2017" filenameBase:@"country"];
    return @[slow, symphony, rock, ballad, jazz, country];
}
-(NSUInteger)totalAlbums {
    return self.albums.count;
}
@end
