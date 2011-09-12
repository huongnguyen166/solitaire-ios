
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
    Deck* _sourceDeck3;
    Deck* _sourceDeck4;
    Deck* _sourceDeck5;
    Deck* _sourceDeck6;
    Deck* _sourceDeck7;
	
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)dealloc;
-(Card*)findActiveCard:(CGPoint)point;
-(Deck*)findActiveDeck:(CGPoint)point;

@property (nonatomic, retain) Deck* sourceDeck;
@property (nonatomic, retain) Deck* sourceDeck2;
@property (nonatomic, retain) Deck* sourceDeck3;
@property (nonatomic, retain) Deck* sourceDeck4;
@property (nonatomic, retain) Deck* sourceDeck5;
@property (nonatomic, retain) Deck* sourceDeck6;
@property (nonatomic, retain) Deck* sourceDeck7;


@end
