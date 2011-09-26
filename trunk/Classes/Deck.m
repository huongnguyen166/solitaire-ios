// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND

#import "Deck.h"


@implementation Deck

@synthesize cardArray = _cardArray;
@synthesize deckId = _deckId;
@synthesize deckRect = _deckRect;
@synthesize deckZ = _deckZ;
@synthesize deckType = _deckType;
@synthesize drawRect = _drawRect;
@synthesize cardCap = _cardCap;


- (id)initWithData:(int)x:(int)y:(int)dId:(int)width:(int)height:(DeckType)type
{
	self = [super init];
    
    BOOL deviceIsPad = (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone);
    if(deviceIsPad) 
        _cardCap = 40;
    else 
        _cardCap = 15;
        
    
    if (self)
    {
        // Create card array for the deck
        self.cardArray = [[NSMutableArray alloc] init];
        self.deckType = type;
        self.deckZ = 0;
        
        // Set deck size and position
        CGRect rect;
        CGPoint point;
        point.x = x;
        point.y = y;
        rect.origin = point;
        rect.size.width = width;
        rect.size.height = height;
        self.deckRect = rect;

        // TODO: remove, not in use
        //self.deckId = dId;
        
        self.drawRect = self.deckRect;
        
    }
    return self;
}

- (void)setNewPos:(int)x:(int)y
{
    CGPoint point;
    point.x = x;
    point.y = y;
    _deckRect.origin.x = point.x;    
    _deckRect.origin.y = point.y;        
    _drawRect.origin.x = point.x;    
    _drawRect.origin.y = point.y;    
}


- (void)dealloc {
    // Rekease array
	[_cardArray release];
    _cardArray = nil;
	// Remember to call base class dealloc
    [super dealloc];
}

- (void)addCard:(Card*)card
{
    // Set card new position
    CGPoint pos;
    pos.x = self.deckRect.origin.x;

    if (self.deckType == ESource && [self.cardArray count]>0)
        pos.y = self.deckRect.origin.y + (_cardCap * [self.cardArray count]-1);
    else {
        pos.y = self.deckRect.origin.y;
    }

    [card setPos:pos.x:pos.y];
    
    // Make deck rect larger
    CGRect rec = [self deckRect];
    rec.size = CGSizeMake(rec.size.width, rec.size.height + _cardCap);
    [self setDeckRect:rec];
    
    // Set deck info to card
    [card setDeck:self];
    
    // Set deck internal z order
    [self setDeckZ:self.deckZ+1];
    [card setZOrder:self.deckZ];
    
    // Parent card
    if([self.cardArray count]>0 ) {
        Card* childCard = [self.cardArray lastObject];
        childCard.cardParent = card;
    } 
        
    
    // Card ownership is transfered to array
    [self.cardArray addObject:card];    
}

- (void)removeCard:(Card*)card
{
    [self.cardArray removeObject:card];
}



-(void)drawDeck:(CGRect)rect
{

    // Do not draw deck if really needed
    if(!CGRectIntersectsRect(rect,self.deckRect)) {
        return;
    }
    
    [[UIColor whiteColor] set];
    UIRectFrame([self drawRect]);
    
    if (self.deckType == ESource) {
        // Draw all cards in ESource decks
        for(Card* card in self.cardArray) {
            [card drawCard];
        }
    }
    else {
        // Draw only top 2 cards in other decks
        if([self.cardArray count]>2) {
            Card* card = [self.cardArray objectAtIndex:[self.cardArray count]-2];        
            [card drawCard];
            card = [self.cardArray objectAtIndex:[self.cardArray count]-1];        
            [card drawCard];
        } else {
            for(Card* card in self.cardArray) {
                [card drawCard];
            }
        }
    }
}

- (Card*)getTopCard
{
    Card* top = nil;
    top = [self.cardArray lastObject];
    return top;
}


- (Card*)getCardAtPos:(CGPoint)point
{
    // Try to find card under (touch) point
    Card* activeCard = nil;
    for(Card* card in self.cardArray) {
        if (CGRectContainsPoint(card.cardRect,point)) {
            if (activeCard==nil) {
                activeCard = card;
            }
            else {
                if (card.zOrder > activeCard.zOrder) 
                    activeCard = card;
            }
        }		
    }
    // Return fourd card
	return activeCard;
}

@end
