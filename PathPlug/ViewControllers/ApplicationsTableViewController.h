//
//  ApplicationsTableViewController.h
//  PathPlug
//
//  Created by Berk Taner on 17/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationsTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *resultArray;
@end
