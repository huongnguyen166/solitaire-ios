
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface MainView : UIView {
	int xCap;
	int yCap;
	
	Card* _activeCard;    
    Deck* _sourceDeck;
	
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)dealloc;

@property (nonatomic, retain) Card* activeCard;
@property (nonatomic, retain) Deck* sourceDeck;


@end
