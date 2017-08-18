//
//  AlbumCell.h
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *albumYear;
@property (weak, nonatomic) IBOutlet UILabel *typeMusic;

@end
