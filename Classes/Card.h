
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>

typedef enum CardType {
    ESpade,
    EHeart,
    EClub,
    EDiamond
} CardType;



@class Deck;

@interface Card : NSObject {
	UIImage* _backgroundImage;
	UIImage* _foregroundImage;
	CGRect _cardRect;
	int _cardId;
	BOOL _turned;
	Card* _cardParent;
	int _zOrder;
    CGPoint _oldPoint;
    Deck* _ownerDeck;
    CardType _cardType;
	
}

- (id)initWithData:(CardType)type:(NSString*)cardName:
(int)x:(int)y:(int)cId:(int)z:(int)width:(int)height;
- (void)setPos:(int)x:(int)y;
- (void)dealloc;
- (void)storeCurrentPos;
- (void)cancelMove;
- (void)setDeck:(Deck*)deck;
- (BOOL)changeDeckTo:(Deck*)fromDeck:(Deck*)toDeck;
- (void)drawCard; 

@property (nonatomic, retain) UIImage* backgroundImage;
@property (nonatomic, retain) UIImage* foregroundImage;
@property CGRect cardRect;
@property int cardId;
@property BOOL turned;
@property (nonatomic, retain) Card* cardParent;
@property int zOrder;
@property CGPoint oldPoint;
@property (nonatomic, assign) Deck* ownerDeck;
@property CardType cardType;

@end
