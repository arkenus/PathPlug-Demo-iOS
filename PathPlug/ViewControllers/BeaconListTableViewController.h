//
//  BeaconListTableViewController.h
//  Smart Location
//
//  Created by Berk Taner on 11/05/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PathPlugSDK/PathPlug.h>

@interface BeaconListTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PathPlugDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
