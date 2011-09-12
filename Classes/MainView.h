
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
    Deck* _sourceDeck2;
	
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)dealloc;
-(Card*)findActiveCard:(CGPoint)point;

@property (nonatomic, retain) Deck* sourceDeck;
@property (nonatomic, retain) Deck* sourceDeck2;

@end
