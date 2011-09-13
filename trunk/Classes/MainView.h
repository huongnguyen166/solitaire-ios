
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface MainView : UIView {
	int xCap;
	int yCap;
	
    // Active card under user touch
	Card* _activeCard; 
    
    // Source decks
    NSMutableArray* _sourceDeckArray;
    NSMutableArray* _targetDeckArray;
    Deck* _wasteDeck1;
    Deck* _wasteDeck2;
    
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)dealloc;
-(Card*)findActiveCard:(CGPoint)point;
-(Deck*)findActiveDeck:(CGPoint)point;


@property (nonatomic, retain) NSMutableArray* sourceDeckArray;
@property (nonatomic, retain) NSMutableArray* targetDeckArray;
@property (nonatomic, retain) Deck* wasteDeck1;
@property (nonatomic, retain) Deck* wasteDeck2;




@end
