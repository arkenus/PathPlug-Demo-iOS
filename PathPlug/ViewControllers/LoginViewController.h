//
//  LoginViewController.h
//  PathPlug
//
//  Created by Berk Taner on 17/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *accessKeyTextField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;


@end
