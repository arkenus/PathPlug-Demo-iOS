//
//  AudioSignViewController.m
//  PathPlug
//
//  Created by Berk Taner on 16/09/14.
//  Copyright (c) 2014 Arkenus. All rights reserved.
//

#import "AudioSignViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioSignViewController ()
@property (strong,nonatomic) AVSpeechSynthesizer *synth;
@property (strong,nonatomic) NSString *language;
@end

@implementation AudioSignViewController
@synthesize synth = _synth;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.synth = [[AVSpeechSynthesizer alloc] init];
    self.language = [[NSLocale preferredLanguages] objectAtIndex:0];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[PathPlug sharedPlug] setDelegate:self];
    [[PathPlug sharedPlug] setAssitanceEnabled:YES];
    [[PathPlug sharedPlug] setAssitanceRefreshInterval:2];
    [[PathPlug sharedPlug] startService];
    self.navigationController.navigationBar.hidden = NO;
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[PathPlug sharedPlug] setAssitanceEnabled:NO];
    [[PathPlug sharedPlug] stopService];
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
    utterance.rate = 0.25;
    utterance.volume = 0.8;
    //[utter]
    [self.synth speakUtterance:utterance];
}

#pragma mark - PathPlug Delegate
static NSPredicate *languagePredicate;
-(void)pathPlug:(PathPlug *)pathPlug getAssistanceData:(PlugData *)data
{
    languagePredicate = [NSPredicate predicateWithFormat:@"language == %@", @"en-US"];
    
 //   AudioSign *sign = [data.audioSignSet filteredSetUsingPredicate:languagePredicate].anyObject;
    AudioSign *sign = [data.audioSignSet anyObject];
    [self speakText:sign.sign_message withLanguage:sign.language];
}


- (IBAction)closeButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
