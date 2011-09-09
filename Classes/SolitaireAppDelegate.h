
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <UIKit/UIKit.h>

@class SolitaireViewController;

@interface SolitaireAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SolitaireViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SolitaireViewController *viewController;

@end

