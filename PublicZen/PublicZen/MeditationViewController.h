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

    UILabel *timerLabel;
    UIButton *startStopButton;
    NSTimer *meditationTimer;
}


@property (nonatomic, retain) IBOutlet UILabel *timerLabel;
@property (nonatomic, retain) IBOutlet UIButton *startStopButton;
@property (nonatomic, retain) NSTimer *meditationTimer;


- (IBAction)startStopTimer:(id)sender;
- (IBAction)meditationSettings:(id)sender;

@end
