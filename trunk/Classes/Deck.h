
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject {

    NSMutableArray* cardArray;
    int deckId;
	CGRect deckRect;


}

- (id)initWithData:(int)x:(int)y:(int)dId;
- (void)addCard:(Card*)card;
- (void)removeCard:(Card*)card;
- (void)drawDeck; 
- (Card*)getCardAtPos:(CGPoint)point;
- (void)dealloc;


@property (retain) NSMutableArray* cardArray;
@property int deckId;
@property CGRect deckRect;

@end
