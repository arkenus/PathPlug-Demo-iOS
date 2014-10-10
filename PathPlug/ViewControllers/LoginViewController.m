//
//  LoginViewController.m
//  PathPlug
//
//  Created by Berk Taner on 17/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#define loginAPI @"http://api.pathplug.com:4000/authorization/login"

#import "LoginViewController.h"
#import "ApplicationsTableViewController.h"
@interface LoginViewController ()<NSURLConnectionDelegate>
@property (strong,nonatomic) NSMutableData *receivedData;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //Keyboard notifications for fields
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}
- (IBAction)loginButtonPressed:(UIButton *)sender {
    [self.loginButton setEnabled:NO];
    [self.loginButton setTitle:@"Logging in..." forState:UIControlStateNormal];
    NSString *email = self.emailTextField.text;
    NSString *accessKey = self.accessKeyTextField.text;
    
    NSString *post = [NSString stringWithFormat:@"email=%@&access_key=%@",email,accessKey];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    [self postRequestWithAPIurl:loginAPI data:postData];
    
    
}
#pragma mark - post part
-(void)postRequestWithAPIurl:(NSString*)apiURL data:(NSData*)postData
{
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:apiURL]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    if(conn){}
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data
{
    [self.receivedData appendData:data];
    
}- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse object.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    self.receivedData =  [NSMutableData data];
    [self.receivedData setLength:0];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
     [self.loginButton setEnabled:YES];
    NSString *responsestring = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    if([responsestring isEqualToString:@"\"wrong input\""])
    {
        //give alert
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please check your credentials" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    else
    {
        NSArray *resultArray = [NSJSONSerialization
                                JSONObjectWithData:self.receivedData
                                options:NSJSONReadingMutableLeaves
                                error:nil];
        
        ApplicationsTableViewController *atvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ApplicationsTableViewController"];
        [atvc setResultArray:resultArray];
        [self.navigationController pushViewController:atvc animated:YES];
        
    }
}

#pragma mark - Keyboard
- (void)keyboardWillBeShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGRect kbRect = [self.view.window convertRect:[[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue] fromView:self.view];
    CGSize kbSize = kbRect.size;
   [UIView animateWithDuration:.5 animations:^{
    [self.view setFrame:CGRectMake(0, -kbSize.height, 320, 568)];
   }];
    }

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView animateWithDuration:.5 animations:^{
      [self.view setFrame:CGRectMake(0, 0, 320, 568)];
  
    }];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
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
