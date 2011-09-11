
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface MainView : UIView {
	int xCap;
	int yCap;
	
	Card* activeCard;    
    Deck* sourceDeck;
	
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)dealloc;



@end
