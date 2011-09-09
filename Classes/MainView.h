
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
//#import <CoreData/CoreData.h>

#import "Card.h"

@interface MainView : UIView {
	int xCap;
	int yCap;
	//Card* card;
	
	Card* activeCard;
	NSMutableArray *cardArray;
	
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;



//@property Card* card;

@end
