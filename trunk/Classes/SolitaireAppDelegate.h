//
//  SolitaireAppDelegate.h
//  Solitaire
//
//  Created by Mac Mini on 5.9.2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SolitaireViewController;

@interface SolitaireAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SolitaireViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SolitaireViewController *viewController;

@end

