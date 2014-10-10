//
//  VirtualTagDetailViewController.m
//  PathPlug
//
//  Created by Berk Taner on 17/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "VirtualTagDetailViewController.h"
#import "SDWebImageDownloader.h"
@interface VirtualTagDetailViewController ()

@end

@implementation VirtualTagDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    NSString *imageURL = [NSString stringWithFormat:@"%@",self.tag.image];
    self.tagTitle.text = self.tag.title;
    self.tagDescription.text = self.tag.tag_description;
    self.tagPriceLabel.text = [NSString stringWithFormat:@"%@ TL",self.tag.price];
    self.tagPriceSaleLabel.text = [NSString stringWithFormat:@"%@ TL",self.tag.sale_price];
    
    [SDWebImageDownloader.sharedDownloader downloadImageWithURL:[NSURL URLWithString:imageURL]
                                                        options:0
                                                       progress:^(NSInteger receivedSize, NSInteger expectedSize)
     {
         // progression tracking code
     }
                                                      completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished)
     {
         if (image && finished)
         {
             self.tagImage.image = image;
         }
     }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeTag:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
