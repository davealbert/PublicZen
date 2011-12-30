  //
  //  QuoteViewController.m
  //  PublicZen
  //
  //  Created by Dave Albert on 28/12/2011.
  //  Copyright 2011 Hermitage Medical Clinic. All rights reserved.
  //

#import "QuoteViewController.h"


@implementation QuoteViewController

#pragma mark - System

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
      // Custom initialization
  }
  return self;
}

- (void)dealloc{
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad{
  [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload{
  [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Supporting Methods

#pragma mark - User Interaction


@end
