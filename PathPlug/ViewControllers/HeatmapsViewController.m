//
//  HeatmapsViewController.m
//  PathPlug
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "HeatmapsViewController.h"

@interface HeatmapsViewController ()

@end

@implementation HeatmapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[PathPlug sharedPlug] setDelegate:self];
    [[PathPlug sharedPlug] setHeatmapEnabled:YES];
    [[PathPlug sharedPlug] startService];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[PathPlug sharedPlug] setHeatmapEnabled:NO];
    [[PathPlug sharedPlug] stopService];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegates
-(void)pathPlug:(PathPlug *)pathPlug getHeatmapData:(PlugData *)data forBeacon:(Beacon *)beacon
{
    self.informationLabel.text = [NSString stringWithFormat:@"%@ on %@",data.actionType,beacon.tag];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)closeButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
