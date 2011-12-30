  //
  //  PublicZenAppDelegate.h
  //  PublicZen
  //
  //  Created by Dave Albert on 28/12/2011.
  //  Copyright 2011 Hermitage Medical Clinic. All rights reserved.
  //

#import <UIKit/UIKit.h>

@interface PublicZenAppDelegate : NSObject<UIApplicationDelegate,UITabBarControllerDelegate> {
  
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
