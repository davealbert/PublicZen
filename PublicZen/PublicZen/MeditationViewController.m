//
//  FirstViewController.m
//  PublicZen
//
//  Created by Dave Albert on 28/12/2011.
//  Copyright 2011 Hermitage Medical Clinic. All rights reserved.
//

#import "MeditationViewController.h"


@implementation MeditationViewController
@synthesize timerLabel;
@synthesize startStopButton;
@synthesize meditationTimer;

- (void)dealloc{
    [meditationTimer release];
    [timerLabel release];
    [startStopButton release];
    [super dealloc];
}

- (void)viewDidUnload{
    [self setMeditationTimer:nil];
    [self setTimerLabel:nil];
    [self setStartStopButton:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad{
 [super viewDidLoad];
 }
 */

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (NSInteger) intUserSetting: (NSString *) key defaultValueIfNotSet:(NSInteger) defaultValue{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger retrievedValue = [[defaults valueForKey:key] intValue];
    if (!retrievedValue) {
        retrievedValue = defaultValue;
        [defaults setValue:[NSNumber numberWithInt:retrievedValue] forKey:key];
    }
    return retrievedValue;
}

- (void) countDownMeditationTime{
    if (timerCounter > 1) {
        timerCounter --;
        [self setTheRunningTimerLabel];        
    } else {
        [self stopTimer];
        [timerLabel setText:@"Finished"];
        [startStopButton setTag:kTimerStopped];
        [startStopButton setImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];        
    }

}

- (NSString *) returnTextForLabel:(NSInteger) intValue{    
    if (intValue <= 9) {
        return [NSString stringWithFormat:@"0%d",intValue];
    } else if (intValue > 9) {
        return [NSString stringWithFormat:@"%d",intValue];
    } else {
        return [NSString stringWithFormat:@"00"];
    }
}

- (void) setTheRunningTimerLabel{
    NSInteger hours = timerCounter / 3600;
    NSInteger minutes = (timerCounter % 3600) / 60;
    NSInteger seconds = timerCounter % 60;
    

    if (hours > 0){
        [timerLabel setText:[NSString stringWithFormat:@"%@:%@:%@",[self returnTextForLabel:hours],[self returnTextForLabel:minutes],[self returnTextForLabel:seconds]]];
    } else if (minutes > 0){
        [timerLabel setText:[NSString stringWithFormat:@"%@:%@",[self returnTextForLabel:minutes],[self returnTextForLabel:seconds]]];
    } else if (seconds > 0){
        [timerLabel setText:[NSString stringWithFormat:@"%@",[self returnTextForLabel:seconds]]];
    } else {
        // No time set
        NSLog(@"setTheTimerLabel: No time set");
    }
}

- (void) startTimer{
    if ([meditationTimer isValid]){
        [meditationTimer invalidate];
        meditationTimer = nil;
    }
    
    // Default to five minutes on first run
    timerCounter = [self intUserSetting:@"meditationTimer"defaultValueIfNotSet:(1*60)];
    
    timerLabel.text = @"";
    [self setTheRunningTimerLabel];
    
    meditationTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDownMeditationTime) userInfo:nil repeats:YES];
}

- (void) stopTimer{
    if ([meditationTimer isValid]){
        [meditationTimer invalidate];
        meditationTimer = nil;
    }
    [timerLabel setText:@""];
    timerCounter = 0;
}

- (IBAction)startStopTimer:(id)sender {
    UIButton *pressedButton = (UIButton *) sender;
    if (pressedButton == nil) {
        // This should never happen.
        NSLog(@"startStopTimer: pressedButton == nil");
        
    } else {
        switch (pressedButton.tag) {
            case kTimerStopped: //tag 0
                [pressedButton setTag:kTimerStarted];
                [pressedButton setImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateNormal];
                [self startTimer];
                break;
                
            case kTimerStarted: //tag 1
                [pressedButton setTag:kTimerStopped];
                [pressedButton setImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];
                [self stopTimer];
                break;            
                
            default:
                break;
        }
    }
    
    pressedButton = nil;
}

- (IBAction)meditationSettings:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSNumber numberWithInt:(1*10)] forKey:@"meditationTimer"];
    [defaults synchronize];
}


@end
