//
//  DetailCell.m
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import "DetailCell.h"

@implementation DetailCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) loadCellWith: (NSString *) title at: (NSIndexPath *) indexPath
{
    self.lblTitle.text = title;
}

@end
