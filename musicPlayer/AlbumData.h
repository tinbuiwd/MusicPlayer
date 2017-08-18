//
//  AlbumData.h
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumData : NSObject

@property (readonly, nonatomic) NSUInteger totalTracks;


@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *tracks;

@property (nonatomic, strong) NSString *filenameForAlbumimage;

@property (nonatomic, strong) NSString *filenameBase;

-(instancetype)initWithTitle:(NSString*)title
                        year:(NSString*)year
                filenameBase:(NSString*)filenameBase;
@end
