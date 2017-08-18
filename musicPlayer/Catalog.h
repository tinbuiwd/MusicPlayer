//
//  Catalog.h
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Catalog : NSObject
@property (nonatomic, strong) NSArray *albums;
@property (nonatomic, readonly) NSUInteger totalAlbums;

@end
