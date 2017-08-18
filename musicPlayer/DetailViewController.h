//
//  DetailViewController.h
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
@class AlbumData;

@interface DetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) AlbumData *album;
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) Player *player;
@property (weak, nonatomic) IBOutlet UIImageView *detailAlbumImage;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;

@property (readwrite) BOOL isPaused;


@property (weak, nonatomic) IBOutlet UISlider *sliderShowCurrentTime;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeElapsed;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeDuration;


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
@end
