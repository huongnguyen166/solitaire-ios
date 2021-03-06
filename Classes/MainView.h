
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>
#include <stdlib.h>

#import "Card.h"
#import "Deck.h"

@interface MainView : UIView {
	int xCap;
	int yCap;
	
    UIImage* _backgroundImage;
    
    // Active card under user touch
	Card* _activeCard; 
    
    NSMutableArray* _cardsArray;
    
    // Source decks
    NSMutableArray* _sourceDeckArray;
    NSMutableArray* _targetDeckArray;
    Deck* _wasteDeck1;
    Deck* _wasteDeck2;
    
    CGPoint _prevPoint;
    
}

-(void)setPositions;
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)dealloc;
-(Card*)findActiveCard:(CGPoint)point;
-(Deck*)findActiveDeck:(CGPoint)point;
-(void)createCards:(int)width:(int)height;
-(id)getRandomCard;
-(BOOL)acceptCardMove:(Deck*)from:(Deck*)to:(Card*)onTopOfCard;


// NOTE: "retain" in property means that 
// object is retained (add reference count +1) 
// before set as instance variable in property generated setter code
@property (nonatomic, retain) UIImage* backgroundImage;
@property (nonatomic, retain) NSMutableArray* sourceDeckArray;
@property (nonatomic, retain) NSMutableArray* targetDeckArray;
@property (nonatomic, retain) Deck* wasteDeck1;
@property (nonatomic, retain) Deck* wasteDeck2;
@property (nonatomic, retain) NSMutableArray* cardsArray;



@end
