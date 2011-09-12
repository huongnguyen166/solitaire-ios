// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND

#import "Deck.h"


@implementation Deck

@synthesize cardArray = _cardArray;
@synthesize deckId = _deckId;
@synthesize deckRect = _deckRect;


- (id)initWithData:(int)x:(int)y:(int)dId
{
	self = [super init];
    
    if (self)
    {
        // Create card array for the deck
        self.cardArray = [[NSMutableArray alloc] init];

        // Set deck size and position
        UIImage* backgroundImage = [UIImage imageNamed:@"Club_ace.png"];
        CGRect rect;
        CGPoint point;
        point.x = x;
        point.y = y;
        rect.origin = point;
        rect.size = backgroundImage.size;
        self.deckRect = rect;
        self.deckId = dId;
        
        [backgroundImage release];
    }
    return self;
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
    [card setPos:self.deckRect.origin.x:self.deckRect.origin.y];
    
    // Card ownership is transfered to array
    [self.cardArray addObject:card];    
}

- (void)removeCard:(Card*)card
{
    // TODO:
}

-(void)drawDeck 
{
    for(int i = 0 ; i < [self.cardArray count] ; i++)
	{
		// TODO: memory leak?
        Card* card = [self.cardArray objectAtIndex:i];
		CGPoint drawingTargetPoint = CGPointMake(card.cardRect.origin.x,card.cardRect.origin.y);
		[card.backgroundImage drawAtPoint:drawingTargetPoint];
	}
	
}

- (Card*)getCardAtPos:(CGPoint)point
{
    // Try to find card under (touch) point
    Card* activeCard = nil;
    for(int i = 0 ; i < [self.cardArray count] ; i++)
    {
        // TODO: memory leak?
        Card* card = [self.cardArray objectAtIndex:i];
        if (CGRectContainsPoint(card.cardRect,point))
        {
            if (activeCard==nil)
            {
                activeCard = card;
            }
            else 
            {
                if (card.zOrder > activeCard.zOrder) 
                    activeCard = card;
            }
        
        }		
    }
    // Return fourd card
	return activeCard;
}

@end
