
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>
#import "Card.h"

#define CARD_CAP 20;

typedef enum {
    ESource,
    ETarget,
    EWaste1,
    EWaste2
} DeckType;


@interface Deck : NSObject {

    NSMutableArray* _cardArray;
    int _deckId;
	CGRect _deckRect;
    CGRect _drawRect;
    int _deckZ;
    DeckType _deckType;


}



- (id)initWithData:(int)x:(int)y:(int)dId:(int)width:(int)height:(DeckType)type;
- (void)addCard:(Card*)card;
- (void)removeCard:(Card*)card;
- (void)drawDeck; 
- (Card*)getCardAtPos:(CGPoint)point;
- (Card*)getTopCard;
- (void)dealloc;


@property (nonatomic, retain) NSMutableArray* cardArray;
@property int deckId;
@property CGRect deckRect;
@property int deckZ;
@property DeckType deckType;
@property CGRect drawRect;

@end
