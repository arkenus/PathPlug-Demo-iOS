//
//  BeaconListTableViewController.m
//  Smart Location
//
//  Created by Berk Taner on 11/05/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "BeaconListTableViewController.h"
#import <PathPlugSDK/Beacon.h>
@interface BeaconListTableViewController ()
@property (strong,nonatomic) NSMutableArray *beaconArray;
@end

@implementation BeaconListTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.beaconArray = [NSMutableArray array];
    //get beacon array
    [[PathPlug sharedPlug] setDelegate:self];
    [[PathPlug sharedPlug] setBeaconInfoEnabled:YES];
    [[PathPlug sharedPlug] startService];
}
-(void)viewWillDisappear:(BOOL)animated
{
     [[PathPlug sharedPlug] setBeaconInfoEnabled:NO];
    [[PathPlug sharedPlug] stopService];
    [super viewWillDisappear:animated];
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.beaconArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"beaconListCell" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"beaconListCell"];
    }
    // Configure the cell...
    Beacon* beacon = [self.beaconArray objectAtIndex:indexPath.row];
    UIImageView *iconView = (UIImageView*)[cell viewWithTag:50];
    UILabel *titleLabel = (UILabel*)[cell viewWithTag:1];
    UILabel *majorLabel = (UILabel*)[cell viewWithTag:2];
    UILabel *minorLabel = (UILabel*)[cell viewWithTag:3];
    UILabel *distanceLabel = (UILabel*)[cell viewWithTag:4];
    if([beacon.type isEqualToString:@"estimote"])
    {
        iconView.image = [UIImage imageNamed:@"estimote"];
    }
    else if([beacon.type isEqualToString:@"gimbal"])
    {
        iconView.image = [UIImage imageNamed:@"gimba"];
    }
    else if([beacon.type isEqualToString:@"kontakt"])
    {
        iconView.image = [UIImage imageNamed:@"kontakt"];
    }
    
    
    titleLabel.text = beacon.tag;
    majorLabel.text = [NSString stringWithFormat:@"%@",beacon.major];
    minorLabel.text = [NSString stringWithFormat:@"%@",beacon.minor];
    distanceLabel.text = [NSString stringWithFormat:@"%.02f m",[beacon.last_distance doubleValue]];
    
    
    return cell;
}
#pragma mark - smartlocation delegate
-(void)pathPlug:(PathPlug *)pathPlug updatedBeaconData:(Beacon *)beacon andDistance:(double)distance
{
    NSInteger index = [self.beaconArray indexOfObject:beacon];
    if(index == NSNotFound)
    {
        [self.beaconArray addObject:beacon];
    }
    else
    {
        [[self.beaconArray objectAtIndex:index] setLast_distance:[NSNumber numberWithDouble:distance]];
    }
    //   NSLog(@"%@",self.beaconArray);
    [self.tableView reloadData];
}
- (IBAction)closeButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
