//
//  VirtualTagsViewController.m
//  PathPlug
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "VirtualTagsViewController.h"
#import "VirtualTagDetailViewController.h"
@interface VirtualTagsViewController ()

@end

@implementation VirtualTagsViewController

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
    [super viewWillAppear:YES];
    [[PathPlug sharedPlug] setDelegate:self];
    [[PathPlug sharedPlug] setVirtualTagEnabled:YES];
    [[PathPlug sharedPlug] startService];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [[PathPlug sharedPlug] setVirtualTagEnabled:NO];
    [[PathPlug sharedPlug] stopService];
}

#pragma mark - Delegate
-(void)pathPlug:(PathPlug *)pathPlug getVirtualtagData:(PlugData *)data
{
    VirtualTagDetailViewController *vtdvc = [self.storyboard instantiateViewControllerWithIdentifier:@"VirtualTagDetailViewController"];
    [vtdvc setTag:data.virtualTag];
    [self presentViewController:vtdvc animated:YES completion:nil];
  //  [self.navigationController pushViewController:vtdvc animated:YES];
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
