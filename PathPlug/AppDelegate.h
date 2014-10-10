//
//  AppDelegate.h
//  PathPlug
//
//  Created by Berk Taner on 04/07/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PathPlugSDK/PathPlug.h>
@import CoreLocation;
@import CoreBluetooth;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) PathPlug *plug;

@end

