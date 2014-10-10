//
//  AccessibilityViewController.h
//  Smart Location
//
//  Created by Berk Taner on 09/05/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AccessibilityViewController : UIViewController<PathPlugDelegate>

@property (weak, nonatomic) IBOutlet UISlider *rateSlider;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
