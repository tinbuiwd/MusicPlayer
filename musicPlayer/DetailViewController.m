//
//  DetailViewController.m
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailCell.h"
#import "AlbumData.h"
#import "Player.h"
#import <Foundation/Foundation.h>
#define kDetailCellIdentifier           @"DetailCell"


@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *songTitles;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setDetailItem: self.album];
    self.songTitles = [[NSArray alloc] initWithArray: self.album.tracks];
    
    self.tableView.delegate     = self;
    self.tableView.dataSource   = self;
    [self.tableView registerNib: [UINib nibWithNibName: kDetailCellIdentifier bundle: nil] forCellReuseIdentifier: kDetailCellIdentifier];
    
    // change ball image of slider
    [self.sliderShowCurrentTime setThumbImage:[UIImage imageNamed:@"ball"] forState:UIControlStateNormal];
}

// cấp phát cho play
- (void)setDetailItem:(AlbumData *)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        AlbumData *album = newDetailItem;
        self.player = [[Player alloc] initWithAlbum:album];
        self.player.audioPlayer.delegate = self;
        
        // Update the view
        [self configureView];
    }
}
- (void)configureView {
    // Update the user interface for the detail item.
    AlbumData *album = self.detailItem;
    if (album)
    {
        NSString *newTitle = [album description];
        [self setTitle:newTitle];
        self.detailAlbumImage.image = [UIImage imageNamed:album.filenameForAlbumimage];
        self.isPaused = NO;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView Delegate | DataSource

- (NSInteger) numberOfSectionsInTableView: (UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return self.songTitles.count;
}

- (UITableViewCell *) tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier: kDetailCellIdentifier forIndexPath: indexPath];
    NSString *songTitle = [self.songTitles objectAtIndex: indexPath.row];
    [cell loadCellWith: songTitle at: indexPath];
    
    const NSInteger trackNumber = indexPath.row + 1;
    
    [cell.trackNumberButton setImage:nil forState:UIControlStateNormal];
    if (trackNumber != self.player.currentTrackNumber) {
        // for most tracks, just displaying the track number.  no icon.  simple.
//        NSString *trackNumberStr = [NSString stringWithFormat:@"%zd", trackNumber];
//        [cell.trackNumberButton setTitle:trackNumberStr forState:UIControlStateNormal];
    } else {
        // for current track, display an icon (so the user knows which track is currently playing or will play if the user pressed "play")
        UIImage *note;
        if (self.player.isPlaying) {
            // this track is playing
            note = [UIImage imageNamed:@"thisTrackIsPlaying.png"];
        } else {
            // this track is paused
            note = [UIImage imageNamed:@"thisTrackIsPaused.png"];
        }
        [cell.trackNumberButton setImage:note forState:UIControlStateNormal];
    }
    cell.lblTitle.text = self.player.currentAlbum.tracks[indexPath.row];
    return cell;
}
//play audio
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (self.player.isLastTrack)
    {
        [self updatePlayButton];
    } else
    {
        [self.player nextTrack];
        [self.player play];
        
        [self updateForwardButton];
        [self updateBackButton];
    }
}

//select row play music
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    const NSInteger trackNumber = indexPath.row + 1;
    [self.player selectTrack:trackNumber];
    [self.player play];
    [self updatePlayButton];
    [self updateBackButton];
    [self updateForwardButton];
}

//button controller//

//update for playbutton
- (void)updatePlayButton
{
    if (self.player.isPlaying) {
        UIImage *newButtonImage = [UIImage imageNamed:@"pause.png"];
        [self.playButton setImage:newButtonImage forState:UIControlStateNormal];
    } else {
        
        UIImage *newButtonImage = [UIImage imageNamed:@"play.png"];
        [self.playButton setImage:newButtonImage forState:UIControlStateNormal];
    }
}

//update for back button
- (void)updateBackButton
{
    BOOL stillRoomToBackUp = !self.player.isFirstTrack;
    [self.backButton setEnabled:stillRoomToBackUp];
    [self updateTableRows];
}


//update for forward button
- (void)updateForwardButton
{
    BOOL stillRoomToGoForward = !self.player.isLastTrack;
    [self.forwardButton setEnabled:stillRoomToGoForward];
    [self updateTableRows];
}

//update for table view detail list song
- (void)updateTableRows
{
    [self.tableView reloadRowsAtIndexPaths:[self.tableView indexPathsForVisibleRows] withRowAnimation:UITableViewRowAnimationNone];
}


//button play pressed
- (IBAction)playButtonPressed:(id)sender
{
    if ( self.player.isPlaying) {
        [self.player pause];
    } else {
        [self.player play];
    }
    [self updatePlayButton];
    [self updateForwardButton];
     self.isPaused = !self.isPaused;
}

//button back pressed
- (IBAction)backButtonPressed:(id)sender
{
    [self.player previousTrack];
    [self updateBackButton];
    [self updateForwardButton];
    
}


//button forward pressed
- (IBAction)forwardButtonPressed:(id)sender
{
    [self.player nextTrack];
    [self updateBackButton];
    [self updateForwardButton];
}


@end
