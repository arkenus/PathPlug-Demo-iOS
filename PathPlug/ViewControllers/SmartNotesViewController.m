//
//  SmartNotesViewController.m
//  PathPlug
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "SmartNotesViewController.h"
#import "UIImageView+WebCache.h"
#import <PathPlugSDK/PathPlugSDK.h>
@interface SmartNotesViewController ()<PathPlugDelegate>
@property NSArray *smartNotesArray;
@end

@implementation SmartNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[PathPlug sharedPlug] setSmartNoteEnabled:YES];
    [[PathPlug sharedPlug] setDelegate:self];
    [[PathPlug sharedPlug] startService];

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[PathPlug sharedPlug] setSmartNoteEnabled:NO];
    [[PathPlug sharedPlug] stopService];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.smartNotesArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"smartNoteCell" forIndexPath:indexPath];
    SmartNote *note = [self.smartNotesArray objectAtIndex:indexPath.row];
    
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:50];
    UILabel *titleLabel = (UILabel*)[cell viewWithTag:1];
    UILabel *descriptionLabel = (UILabel*)[cell viewWithTag:2];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:note.image]
                                     placeholderImage:nil];
    
    titleLabel.text = note.title;
    descriptionLabel.text = note.information;
    
    
    
    return cell;
}

#pragma mark - PathPlug Delegate
-(void)pathPlug:(PathPlug *)pathPlug getSmartNoteData:(PlugData *)data
{
    self.smartNotesArray = [data.smartNoteSet allObjects];
    [self.collectionView reloadData];
}

- (IBAction)closeButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
