//
//  SetupViewController.m
//  PathPlug
//
//  Created by Berk Taner on 07/07/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()<PathPlugDelegate>

@end

@implementation SetupViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
       [self setup];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - PathPlugSDK test 1
-(void)setup
{
    
    [[PathPlug sharedPlug] setDataRefreshInterval:self.refresh_interval];
    [[PathPlug sharedPlug] setDelegate:self];
   // [self.plug startService];
}

-(void)pathPlug:(PathPlug *)pathPlug updatedSetupMessage:(NSString *)message
{
    self.statusLabel.text = message;
}
-(void)pathPlug:(PathPlug *)pathPlug isFrameworkReady:(BOOL)result
{
    if(result == YES)
    {
        self.statusLabel.text = @"Done";
        [self performSegueWithIdentifier:@"showMenuSegue" sender:self];
    }
}

@end
