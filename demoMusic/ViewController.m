//
//  ViewController.m
//  demoMusic
//
//  Created by Bui Van Tin on 7/19/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import "ViewController.h"
@import AVFoundation;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *sliderShowCurrentTime;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeElapsed;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeDuration;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayPause;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController {
    BOOL isPaused;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isPaused = true;
    [self setupAVAudioPlayerName:@"Hon-Anh-MIN" andFileExtension:@".mp3"];
    
    // change slider image
    
    [self.sliderShowCurrentTime setThumbImage:[UIImage imageNamed:@"ball"] forState:UIControlStateNormal];
    
    
    
}

- (void)setupAVAudioPlayerName: (NSString*)nameSong
              andFileExtension: (NSString*)fileExtension {
    
    NSURL *audioFileURL = [[NSBundle mainBundle] URLForResource:nameSong withExtension:fileExtension];
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileURL error:&error];
    
    
    //set slider = time audio, duration will return summary time is second.
     _sliderShowCurrentTime.maximumValue = [self.audioPlayer duration];
    
    //set time begin for lableTimeElapsed
     _labelTimeElapsed.text = @"0:00";
    
    //after convert time, call function convertime
     _labelTimeDuration.text = [NSString stringWithFormat:@"-%@", [self convertTimeFormat:self.audioPlayer.duration]];
    
    [_audioPlayer prepareToPlay];
    
    
}

/* func convert time format */
- (NSString*)convertTimeFormat: (float)time {
    int minutes = time/60;
    int seconds = (int)time % 60;
    
    //return string with format minutes, seconds
    //%@ check minutes/10 > 0 ->audio > 10minutes, if < 10, @"".
    return [NSString stringWithFormat:@"%@%d:%@%d", minutes/10 ? [NSString stringWithFormat:@"%d",minutes/10] : @"", minutes%10, [NSString stringWithFormat:@"%d", seconds/10], seconds%10];
    
}

/* updateTime to slider */
- (void)updateTime {
    _sliderShowCurrentTime.value = [self.audioPlayer currentTime]; // current time will return time of music play at that time.
    _labelTimeElapsed.text = [NSString stringWithFormat:@"%@",[self convertTimeFormat:[self.audioPlayer currentTime]]];
    _labelTimeDuration.text = [NSString stringWithFormat:@"-%@", [self convertTimeFormat:self.audioPlayer.duration - self.audioPlayer.currentTime]];
}

/*Action Play and Pause*/
- (IBAction)btnPlayPause:(id)sender {
    if(isPaused) {
        NSLog(@"Play");
        [self.audioPlayer play];
        [self.btnPlayPause setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        //
         _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        isPaused = false;
    }else {
        NSLog(@"Pause");
        [self.audioPlayer pause];
        [self.btnPlayPause setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        isPaused = true;
    }
    
}

/*Action Stop Music*/
//- (IBAction)btnStopAudioPlayer:(id)sender {
//    NSLog(@"Stop");
//    [self.audioPlayer stop]; //the stop method stops playback completely, and unloads the sound from memory, but not reset currentTime
//    [self.audioPlayer setCurrentTime:0]; //returns the current time associated with the output device
//    _sliderShowCurrentTime.value = 0;
//    _labelTimeElapsed.text = @"0:00";
//    _labelTimeDuration.text = [NSString stringWithFormat:@"-%@", [self convertTimeFormat:self.audioPlayer.duration]];
//    [self.btnPlayPause setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
//    isPaused = true;
//    if ([_timer isValid]){
//        [_timer invalidate];
//        _timer = nil;
//    }
//}

/*Action slider audio*/
- (IBAction)valueChanged:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime) userInfo:nil repeats:NO];
    [self.audioPlayer setCurrentTime:self.sliderShowCurrentTime.value];
}

@end
