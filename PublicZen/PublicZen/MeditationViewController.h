  //
  //  FirstViewController.h
  //  PublicZen
  //
  //  Created by Dave Albert on 28/12/2011.
  //  Copyright 2011 Hermitage Medical Clinic. All rights reserved.
  //

#import <UIKit/UIKit.h>

enum {
  kTimerStopped = 0,
  kTimerStarted = 1
};

@interface MeditationViewController : UIViewController {  
  
#pragma mark - iVars  
#pragma mark  Timers
  NSTimer *meditationTimer;
  
#pragma mark  Labels
  UILabel *timerLabel;
  
#pragma mark  Buttons
  UIButton *startStopButton;
  
#pragma mark  Simple
  NSInteger timerCounter;
  
}

#pragma mark - Properties
#pragma mark * Timers
@property (nonatomic, retain) NSTimer *meditationTimer;

#pragma mark * Labels
@property (nonatomic, retain) IBOutlet UILabel *timerLabel;

#pragma mark * Buttons
@property (nonatomic, retain) IBOutlet UIButton *startStopButton;


#pragma mark - Supporting Methods
- (NSInteger)intUserSetting: (NSString *) key defaultValueIfNotSet:(NSInteger) defaultValue;
- (void)setTheRunningTimerLabel;
- (void)stopTimer;
- (void)startTimer;
- (NSString *)returnTextForLabel:(NSInteger) intValue;
- (void)countDownMeditationTime;

#pragma mark - User Interactions
- (IBAction)startStopTimer:(id)sender;
- (IBAction)meditationSettings:(id)sender;

@end
