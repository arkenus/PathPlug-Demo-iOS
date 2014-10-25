//
//  ApplicationsTableViewController.m
//  PathPlug
//
//  Created by Berk Taner on 17/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "ApplicationsTableViewController.h"
#import "SetupViewController.h"
#import "UIImageView+WebCache.h"
@interface ApplicationsTableViewController ()

@end

@implementation ApplicationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.resultArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"applicationCell" forIndexPath:indexPath];
    
    NSDictionary *application = [self.resultArray objectAtIndex:indexPath.row];
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:50];
    UILabel *label = (UILabel*)[cell viewWithTag:1];
    label.text = [application objectForKey:@"app_name"];
    if([[application objectForKey:@"app_icon"]class] != [NSNull class] )
    [imageView sd_setImageWithURL:[NSURL URLWithString:[application objectForKey:@"app_icon"]]
placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSDictionary *application = [self.resultArray objectAtIndex:indexPath.row];
    SetupViewController *setup = [self.storyboard instantiateViewControllerWithIdentifier:@"SetupViewController"];
    
    [setup setApp_key:[application objectForKey:@"app_key"]];
    [setup setApp_secret:[application objectForKey:@"app_secret"]];
    [setup setRefresh_interval:[[application objectForKey:@"refresh_interval"] doubleValue]];
    [self.navigationController pushViewController:setup animated:YES];
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
