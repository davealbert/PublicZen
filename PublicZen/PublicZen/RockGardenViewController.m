  //
  //  SecondViewController.m
  //  PublicZen
  //
  //  Created by Dave Albert on 28/12/2011.
  //  Copyright 2011 Hermitage Medical Clinic. All rights reserved.
  //

#import "RockGardenViewController.h"


@implementation RockGardenViewController

#pragma mark - System

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
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


- (void)viewDidUnload{
  [super viewDidUnload];
  
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc{
  [super dealloc];
}

#pragma mark - Supporting Methods

#pragma mark - User Interaction

@end
