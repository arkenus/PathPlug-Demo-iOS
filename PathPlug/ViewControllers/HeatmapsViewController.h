//
//  HeatmapsViewController.h
//  PathPlug
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PathPlugSDK/PathPlugSDK.h>
@interface HeatmapsViewController : UIViewController<PathPlugDelegate>
@property (strong, nonatomic) IBOutlet UILabel *informationLabel;

@end
