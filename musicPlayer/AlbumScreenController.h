//
//  AlbumScreenController.h
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Catalog.h"

@interface AlbumScreenController : UITableViewController<UITabBarDelegate>
@property (nonatomic, strong) Catalog *catalog;

@end
