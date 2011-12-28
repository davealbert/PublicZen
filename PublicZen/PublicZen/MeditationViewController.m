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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [self setTimerLabel:nil];
    [self setStartStopButton:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [timerLabel release];
    [startStopButton release];
    [super dealloc];
}

- (IBAction)startStopTimer:(id)sender {
    UIButton *pressedButton = (UIButton *) sender;
    switch (pressedButton.tag) {
        case kTimerStopped:
            [pressedButton setTag:kTimerStarted];
            [pressedButton setImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateNormal];
            break;
            
        case kTimerStarted:
            [pressedButton setTag:kTimerStopped];
            [pressedButton setImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];
            break;            
        
        default:
            break;
    }
}


@end
