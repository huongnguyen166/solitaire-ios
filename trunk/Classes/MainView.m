
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "MainView.h"


@implementation MainView

@synthesize sourceDeck = _sourceDeck;
@synthesize sourceDeck2 = _sourceDeck2;

-(id) initWithCoder:(NSCoder*)sourceCoder
{
	if( (self = [super initWithCoder:sourceCoder]))
	{
        int screenWidth = self.bounds.size.width;
        int screenHeight = self.bounds.size.height;
        int cardWidth = screenWidth / 9;
        int cardHeight = cardWidth * 1.7;
        int cap = (screenWidth - cardWidth*7) / 8;
        
        // Source decks
        self.sourceDeck = [Deck alloc];
        [self.sourceDeck initWithData:cap:cardHeight*2:1:cardWidth:cardHeight];
		for (int i=0;i<10;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        
        self.sourceDeck2 = [Deck alloc];
        [self.sourceDeck2 initWithData:cap*2+cardWidth:cardHeight*2:2:cardWidth:cardHeight];
		for (int i=0;i<5;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck2 addCard:card];
            [card release];
            card = nil;
		}
        
	}
	return self;
}

- (void)dealloc {
	[_sourceDeck release];
    _sourceDeck = nil;
        
	[_sourceDeck2 release];
    _sourceDeck2 = nil;

	// Remember to call base class dealloc
    [super dealloc];
}


-(void)drawRect:(CGRect)rect {
    //CGContextRef    context = UIGraphicsGetCurrentContext();
	
    // Game background
	[[UIColor greenColor] set];
	UIRectFill(rect);
	
    // Draw decks
    [self.sourceDeck drawDeck];
    [self.sourceDeck2 drawDeck];
	
    // Draw active card on top of all others
	if (_activeCard)
	{
		[_activeCard drawCard];
        //CGPoint drawingTargetPoint = CGPointMake(_activeCard.cardRect.origin.x,
        //                                         _activeCard.cardRect.origin.y);
		//[_activeCard.backgroundImage drawAtPoint:drawingTargetPoint];
		
	}
	
}

-(Card*)findActiveCard:(CGPoint)point
{
    // TODO: make better
    Card* card = nil;
    card = [self.sourceDeck getCardAtPos:point];
    if (!card) {
        card = [self.sourceDeck2 getCardAtPos:point];
    }
    return card;
}

-(Deck*)findActiveDeck:(CGPoint)point
{
    Deck* deck = nil;
    
    // TODO: make better
    
    if (CGRectContainsPoint(self.sourceDeck.deckRect,point))
    {
        deck = self.sourceDeck;
    }
    else if(CGRectContainsPoint(self.sourceDeck2.deckRect,point))
    {
        deck = self.sourceDeck2;
    }
    
    
    return deck;
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touchPoint = [touches anyObject]; 
    CGPoint point = [touchPoint locationInView:self];   
	
    _activeCard = [self findActiveCard:point];
    //_activeCard = [self.sourceDeck getCardAtPos:point];
    if (_activeCard)
    {
        xCap = point.x - _activeCard.cardRect.origin.x;
        yCap = point.y - _activeCard.cardRect.origin.y;
        
        [_activeCard storeCurrentPos];
	}
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (_activeCard)
	{
        UITouch* touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
		[_activeCard setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{	
	if (_activeCard)
	{
        UITouch* touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
		[_activeCard setPos:point.x - xCap:point.y - yCap];
		
        
        // Change car deck to another
        Deck* toDeck = [self findActiveDeck:point];
        if (toDeck) {
            BOOL ret = [_activeCard changeDeckTo:_activeCard.ownerDeck:toDeck];
            if (!ret) 
               [_activeCard cancelMove]; 
        } else {
            [_activeCard cancelMove];
        }
    
        
        [self setNeedsDisplay];
		_activeCard = nil;
	}
    
}



@end
