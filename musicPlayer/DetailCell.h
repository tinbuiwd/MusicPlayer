//
//  DetailCell.h
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlbumData;

@interface DetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *trackNumberButton;


- (void) loadCellWith: (NSString *) title at: (NSIndexPath *) indexPath;

@end
