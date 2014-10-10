//
//  SetupViewController.h
//  PathPlug
//
//  Created by Berk Taner on 07/07/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SetupViewController : UIViewController<PathPlugDelegate>
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (strong,nonatomic) NSString *app_key;
@property (strong,nonatomic) NSString *app_secret;
@property double refresh_interval;
@end
