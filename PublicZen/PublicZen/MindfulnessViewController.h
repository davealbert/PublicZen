  //
  //  MindfulnessViewController.h
  //  PublicZen
  //
  //  Created by Dave Albert on 28/12/2011.
  //  Copyright 2011 Hermitage Medical Clinic. All rights reserved.
  //

#import <UIKit/UIKit.h>


@interface MindfulnessViewController : UIViewController {
  
  UISwitch *mindfulnessSwitch;
  UITextField *startHour;
  UITextField *startMinute;
  UITextField *intervalHour;
  UITextField *intervalMinute;
  UITextField *endHour;
  UITextField *endMinute;
}

@property (nonatomic, retain) IBOutlet UISwitch *mindfulnessSwitch;
@property (nonatomic, retain) IBOutlet UITextField *startHour;
@property (nonatomic, retain) IBOutlet UITextField *startMinute;
@property (nonatomic, retain) IBOutlet UITextField *intervalHour;
@property (nonatomic, retain) IBOutlet UITextField *intervalMinute;
@property (nonatomic, retain) IBOutlet UITextField *endHour;
@property (nonatomic, retain) IBOutlet UITextField *endMinute;

#pragma mark - Supporting Methods
- (void)saveTime:(NSInteger)time forTimeOption:(NSString *)timeOption;
- (NSString *)getTime:(NSString *)timeOption;

#pragma mark - User Interaction
- (IBAction)toggleMindfulness:(id)sender;
- (IBAction)saveMindfulness:(id)sender;
@end
