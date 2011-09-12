
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>


@class Deck;

@interface Card : NSObject {
	UIImage* _backgroundImage;
	CGRect _cardRect;
	int _cardId;
	int _cardLand;
	BOOL _isTurned;
	Card* _cardParent;
	int _zOrder;
    CGPoint _oldPoint;
    Deck* _ownerDeck;
	
}

- (id)initWithData:(NSString*)cardName:
(int)x:(int)y:(int)cId:(int)cLand:(int)z:(int)width:(int)height;
- (void)setPos:(int)x:(int)y;
- (void)dealloc;
- (void)storeCurrentPos;
- (void)cancelMove;
- (void)setDeck:(Deck*)deck;
- (BOOL)changeDeckTo:(Deck*)fromDeck:(Deck*)toDeck;
- (void)drawCard; 

@property (nonatomic, retain) UIImage* backgroundImage;
@property CGRect cardRect;
@property int cardId;
@property int cardLand;
@property BOOL isTurned;
@property (nonatomic, retain) Card* cardParent;
@property int zOrder;
@property CGPoint oldPoint;
@property (nonatomic, assign) Deck* ownerDeck;

@end
