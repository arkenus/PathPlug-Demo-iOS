//
//  VirtualTagDetailViewController.h
//  PathPlug
//
//  Created by Berk Taner on 17/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <PathPlugSDK/VirtualTag.h>
@interface VirtualTagDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *tagImage;
@property (strong, nonatomic) IBOutlet UILabel *tagTitle;

@property (strong, nonatomic) IBOutlet UILabel *tagDescription;
@property (strong, nonatomic) IBOutlet UILabel *tagPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *tagPriceSaleLabel;

@property (strong,nonatomic) VirtualTag *tag;

@end
