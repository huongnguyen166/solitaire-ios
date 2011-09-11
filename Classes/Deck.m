// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND

#import "Deck.h"


@implementation Deck

@synthesize cardArray;
@synthesize deckId;
@synthesize deckRect;


- (id)initWithData:(int)x:(int)y:(int)dId
{
	self = [super init];
    
    if (self)
    {
        // Create card array for the deck
        cardArray = [[NSMutableArray alloc] init];

        // Set deck size and position
        UIImage* backgroundImage = [UIImage imageNamed:@"Club_ace.png"];
        deckRect.size = backgroundImage.size;
        CGPoint point;
        point.x = x;
        point.y = y;
        deckRect.origin = point;
        deckId = dId;
        [backgroundImage release];
    }
    return self;
}

- (void)dealloc {
    // Rekease array
	[cardArray release];
	// Remember to call base class dealloc
    [super dealloc];
}

- (void)addCard:(Card*)card
{
    // Set card new position
    [card setPos:deckRect.origin.x:deckRect.origin.y];
    
    // Card ownership is transfered to array
    [cardArray addObject:card];    
}

- (void)removeCard:(Card*)card
{
    // TODO:
}

-(void)drawDeck 
{
    for(int i = 0 ; i < [cardArray count] ; i++)
	{
		Card* card = [[cardArray objectAtIndex:i]retain];
		CGPoint drawingTargetPoint = CGPointMake(card.cardRect.origin.x,card.cardRect.origin.y);
		[card.backgroundImage drawAtPoint:drawingTargetPoint];
        [card release];
		card = nil;
	}
	
}

- (Card*)getCardAtPos:(CGPoint)point
{
    // Try to find card under (touch) point
    Card* activeCard = nil;
    for(int i = 0 ; i < [cardArray count] ; i++)
    {
        Card* card = [cardArray objectAtIndex:i];
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
