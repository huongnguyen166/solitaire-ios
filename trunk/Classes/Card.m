
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND

#import "Card.h"
#import "Deck.h"

@implementation Card

@synthesize backgroundImage = _backgroundImage;
@synthesize cardRect = _cardRect;
@synthesize cardId = _cardId;
@synthesize cardLand = _cardLand;
@synthesize isTurned = _isTurned;
@synthesize cardParent = _cardParent;
@synthesize zOrder = _zOrder;
@synthesize oldPoint = _oldPoint;
@synthesize ownerDeck = _ownerDeck;



- (id)initWithData:(NSString*)cardName:
    (int)x:(int)y:(int)cId:(int)cLand:(int)z:(int)width:(int)height
{
	self = [super init];

    if (self)
    {
    // Load card graphics
	self.backgroundImage = [UIImage imageNamed:cardName];
	
    // Set card position and z order
	CGPoint point;
	point.x = x;
	point.y = y;
    CGRect rect;
    rect.origin = point;
    rect.size.width = width;
    rect.size.height = height;
    self.cardRect = rect;        
	self.zOrder = z;
    }
	
	return self;
}

- (void)dealloc {
	[_backgroundImage release];
    _backgroundImage = nil;

	// Remember to call base class dealloc
    [super dealloc];
}

- (void)drawCard
{
    [self.backgroundImage drawInRect:self.cardRect];
}

- (void)storeCurrentPos
{
    self.oldPoint = self.cardRect.origin;
}

- (void)cancelMove
{
    [self setPos:self.oldPoint.x:self.oldPoint.y];
}

- (void)setPos:(int)x:(int)y
{
    CGRect newRect = self.cardRect;
	CGPoint point;
	point.x = x;
	point.y = y;
    newRect.origin = point;
	self.cardRect = newRect;
}

-(void)setDeck:(Deck*)deck
{
    _ownerDeck = deck;
}

-(BOOL)changeDeckTo:(Deck*)fromDeck:(Deck*)toDeck
{
    if (fromDeck != toDeck)
    {
    
    // Add to new deck
    [toDeck addCard:self];
    
    // Remove from old deck
    [fromDeck removeCard:self];
        return TRUE;
    }
    return FALSE;
}



@end
