//
//  AlbumScreenController.m
//  musicPlayer
//
//  Created by Bui Van Tin on 8/17/17.
//  Copyright © 2017 Bui Van Tin. All rights reserved.
//

#import "AlbumScreenController.h"
#import "AlbumCell.h"
#import "AlbumData.h"
#import "DetailCell.h"
#import "DetailViewController.h"

@interface AlbumScreenController ()

@end

@implementation AlbumScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib: [UINib nibWithNibName: @"AlbumCell" bundle: nil] forCellReuseIdentifier: @"AlbumCell"];
    self.catalog = [[Catalog alloc] init];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.catalog.albums.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AlbumCell *cell = (AlbumCell *) [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
    
    AlbumData *album = self.catalog.albums[indexPath.row];
    cell.albumImage.image = [UIImage imageNamed:album.filenameForAlbumimage];
    cell.albumYear.text  = album.year;
    cell.typeMusic.text  = album.title;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumData *album = self.catalog.albums[indexPath.row];
    
    DetailViewController *detailVC = [[DetailViewController alloc] initWithNibName: @"DetailViewController" bundle: nil];
    detailVC.album = album;

    [self.navigationController pushViewController:detailVC animated:YES];
}

// change heigth of Cell
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 92;
}

@end
