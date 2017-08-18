//
//  AboutScreenController.m
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import "AboutScreenController.h"

@interface AboutScreenController ()
@property(nonatomic, strong) UITextView *textView;

@end

@implementation AboutScreenController {
    NSTimer *autoscrollTimer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backGround = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backGround.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:backGround];
    
    [self addTextView];
    
}

- (void) addTextView
{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 150, self.view.bounds.size.width-40, self.view.bounds.size.height - 300)];
    self.textView.text = @"\n\n\n\n\n   This is my first simple demo about music player. I will update more and more this application.\n\n   I will create more features, such as online music player, download, search song by artist, album...\n\n Thank you very much for your support. thank you.";
    
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.textColor = [UIColor whiteColor];
    self.textView.font = [UIFont fontWithName:@"Helvetica" size:17];
    
    if (autoscrollTimer == nil) {
        autoscrollTimer = [NSTimer scheduledTimerWithTimeInterval:(30.0/1000.0)
                                                           target:self
                                                         selector:@selector(autoscrollTextView)
                                                         userInfo:nil
                                                          repeats:YES];
    }
     self.textView.editable = NO;
    [self.view addSubview:self.textView];
}

- (void)autoscrollTextView
{
    CGPoint scrollPoint = self.textView.contentOffset;
    //NSLog(@"%@", NSStringFromCGPoint(scrollPoint));
    scrollPoint = CGPointMake(scrollPoint.x, scrollPoint.y + 1);
    
    if (scrollPoint.y > 400)
    {
        scrollPoint.y = -300;
    }
    [self.textView setContentOffset:scrollPoint animated:NO];
}



@end

