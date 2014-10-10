//
//  AccessibilityViewController.m
//  Smart Location
//
//  Created by Berk Taner on 09/05/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "AccessibilityViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AccessibilityViewController ()
@property (strong,nonatomic) AVSpeechSynthesizer *synth;
@end

@implementation AccessibilityViewController

@synthesize synth = _synth;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.synth = [[AVSpeechSynthesizer alloc] init];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[PathPlug sharedPlug] setDelegate:self];
    [[PathPlug sharedPlug] setAssitanceEnabled:YES];
    [[PathPlug sharedPlug] setAssitanceRefreshInterval:2];
     self.navigationController.navigationBar.hidden = NO;

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[PathPlug sharedPlug] setAssitanceEnabled:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)speakText:(NSString*)text withLanguage:(NSString*)language
{
    AVSpeechUtterance *utterance = [AVSpeechUtterance
                                    speechUtteranceWithString:text];
  //  [utterance setRate:10];
    
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:language ];
    utterance.rate = self.rateSlider.value;
    utterance.volume = self.volumeSlider.value;
    //[utter]
    [self.synth speakUtterance:utterance];
}

#pragma mark - SmartLocation
-(void)pathPlug:(PathPlug *)pathPlug getAsistanceData:(PlugData *)data
{
    /*
    if(data.audioSignSet obje)
    
    
    if([data.language isEqualToString:@"en"])
        [self speakText:data.content withLanguage:@"en-GB"];
    else
        [self speakText:data.content withLanguage:@"tr-TR"];
     */
}

- (IBAction)setSmartLocationActive:(UISwitch *)sender {

        [[PathPlug sharedPlug]setAssitanceEnabled:sender.on];
    
}
@end
