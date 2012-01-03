  //
  //  MindfulnessViewController.m
  //  PublicZen
  //
  //  Created by Dave Albert on 28/12/2011.
  //  Copyright 2011 Hermitage Medical Clinic. All rights reserved.
  //

#import "MindfulnessViewController.h"


@implementation MindfulnessViewController
@synthesize mindfulnessSwitch;
@synthesize startHour;
@synthesize startMinute;
@synthesize intervalHour;
@synthesize intervalMinute;
@synthesize endHour;
@synthesize endMinute;

#pragma mark - System

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
      // Custom initialization
  }
  return self;
}

- (void)awakeFromNib{

}

- (void)dealloc{
  [mindfulnessSwitch release];
  [startHour release];
  [startMinute release];
  [intervalHour release];
  [intervalMinute release];
  [endHour release];
  [endMinute release];
  [super dealloc];
}

- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
    // Do any additional setup after loading the view from its nib.
  [startHour setText:[self getTime:@"startHour"]];
  [startMinute setText:[self getTime:@"startMinute"]];
  [intervalHour setText:[self getTime:@"intervalHour"]];
  [intervalMinute setText:[self getTime:@"intervalMinute"]];
  [endHour setText:[self getTime:@"endHour"]];
  [endMinute setText:[self getTime:@"endMinute"]];  
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *retrievedValue = [defaults valueForKey:@"toggleMindfulness"];
  if ([retrievedValue isEqualToString:@"YES"]) {
    [mindfulnessSwitch setOn:YES];
  } else {
    [mindfulnessSwitch setOn:NO];
  }
}

- (void)viewDidUnload{
  [self setMindfulnessSwitch:nil];
  [self setStartHour:nil];
  [self setStartMinute:nil];
  [self setIntervalHour:nil];
  [self setIntervalMinute:nil];
  [self setEndHour:nil];
  [self setEndMinute:nil];
  [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{ 
	[textField resignFirstResponder];
	return YES; 
}

#pragma mark - Supporting Methods
- (void)saveTime:(NSInteger)time forTimeOption:(NSString *)timeOption{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setValue:[NSNumber numberWithInt:time] forKey:timeOption];
  [defaults synchronize];
}

- (NSString *)getTime:(NSString *)timeOption{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSInteger retrievedValue = [[defaults valueForKey:timeOption] intValue];
  if (!retrievedValue){
    retrievedValue = 0;
  } 
  NSString *tmpString = [NSString stringWithFormat:@"%d",retrievedValue];
  return tmpString;
}


#pragma mark - User Interaction

- (IBAction)toggleMindfulness:(id)sender {
  UISwitch *toggleButton = ((UISwitch *) sender);
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  if (toggleButton.on) {
    [defaults setValue:@"YES" forKey:@"toggleMindfulness"];    
  } else {
    [defaults setValue:@"NO" forKey:@"toggleMindfulness"];    
  }
  [defaults synchronize];
}

- (IBAction)saveMindfulness:(id)sender {
  [self saveTime:[startHour.text intValue] forTimeOption:@"startHour"];
  [self saveTime:[startMinute.text intValue] forTimeOption:@"startMinute"]; 
  [self saveTime:[intervalHour.text intValue] forTimeOption:@"intervalHour"];
  [self saveTime:[intervalMinute.text intValue] forTimeOption:@"intervalMinute"];
  [self saveTime:[endHour.text intValue] forTimeOption:@"endHour"];
  [self saveTime:[endMinute.text intValue] forTimeOption:@"endMinute"];
}

@end
