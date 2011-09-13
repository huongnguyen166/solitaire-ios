
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
    
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)dealloc;
-(Card*)findActiveCard:(CGPoint)point;
-(Deck*)findActiveDeck:(CGPoint)point;


@property (nonatomic, retain) NSMutableArray* sourceDeckArray;
@property (nonatomic, retain) NSMutableArray* targetDeckArray;

@end
