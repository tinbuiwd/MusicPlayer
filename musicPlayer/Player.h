//
//  Player.h
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AVFoundation;
@class AlbumData;
@interface Player : NSObject

- (instancetype)initWithAlbum:(AlbumData *)album;

- (void)pause;
- (void)play;

- (void)selectTrack:(NSUInteger)trackNumber;
- (NSUInteger)nextTrack;
- (NSUInteger)previousTrack;

@property (readonly, nonatomic) BOOL isPlaying;
@property (readonly, nonatomic) BOOL isPaused;
@property (readonly, nonatomic) BOOL isStopped;

@property (strong, nonatomic) AlbumData *currentAlbum;
@property (readonly, nonatomic) NSUInteger currentTrackNumber;
@property (readwrite, nonatomic) BOOL isFirstTrack;
@property (readwrite, nonatomic) BOOL isLastTrack;


@property (readwrite, atomic) NSUInteger currentTrackIndex;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
