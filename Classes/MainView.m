
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "MainView.h"


@implementation MainView

@synthesize sourceDeck = _sourceDeck;
@synthesize sourceDeck2 = _sourceDeck2;
@synthesize sourceDeck3 = _sourceDeck3;
@synthesize sourceDeck4 = _sourceDeck4;
@synthesize sourceDeck5 = _sourceDeck5;
@synthesize sourceDeck6 = _sourceDeck6;
@synthesize sourceDeck7 = _sourceDeck7;


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
        [self.sourceDeck initWithData:cap:cardHeight*2:1:cardWidth:cardHeight:ESource];
		for (int i=0;i<2;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        
        self.sourceDeck2 = [Deck alloc];
        [self.sourceDeck2 initWithData:cap*2+cardWidth:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<3;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck2 addCard:card];
            [card release];
            card = nil;
		}

        self.sourceDeck3 = [Deck alloc];
        [self.sourceDeck3 initWithData:cap*3+cardWidth*2:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<4;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck3 addCard:card];
            [card release];
            card = nil;
		}

        self.sourceDeck4 = [Deck alloc];
        [self.sourceDeck4 initWithData:cap*4+cardWidth*3:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<5;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck4 addCard:card];
            [card release];
            card = nil;
		}

        self.sourceDeck5 = [Deck alloc];
        [self.sourceDeck5 initWithData:cap*5+cardWidth*4:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<6;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck5 addCard:card];
            [card release];
            card = nil;
		}

        self.sourceDeck6 = [Deck alloc];
        [self.sourceDeck6 initWithData:cap*6+cardWidth*5:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<7;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck6 addCard:card];
            [card release];
            card = nil;
		}

        self.sourceDeck7 = [Deck alloc];
        [self.sourceDeck7 initWithData:cap*7+cardWidth*6:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<8;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i:cardWidth:cardHeight];
            [self.sourceDeck7 addCard:card];
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
    [self.sourceDeck3 drawDeck];
    [self.sourceDeck4 drawDeck];
    [self.sourceDeck5 drawDeck];
    [self.sourceDeck6 drawDeck];
    [self.sourceDeck7 drawDeck];
	
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
    if (!card) {
        card = [self.sourceDeck3 getCardAtPos:point];
    } 
    if (!card) {
        card = [self.sourceDeck4 getCardAtPos:point];
    } 
    if (!card) {
        card = [self.sourceDeck5 getCardAtPos:point];
    } 
    if (!card) {
        card = [self.sourceDeck6 getCardAtPos:point];
    } 
    if (!card) {
        card = [self.sourceDeck7 getCardAtPos:point];
    }

    
    return card;
}

-(Deck*)findActiveDeck:(CGPoint)point
{
    Deck* deck = nil;
    
    // TODO: make better
    
    if (!deck && CGRectContainsPoint(self.sourceDeck.deckRect,point))
    {
        deck = self.sourceDeck;
    }
    if(!deck && CGRectContainsPoint(self.sourceDeck2.deckRect,point))
    {
        deck = self.sourceDeck2;
    }
    if(!deck && CGRectContainsPoint(self.sourceDeck3.deckRect,point))
    {
        deck = self.sourceDeck3;
    }
    if(!deck && CGRectContainsPoint(self.sourceDeck4.deckRect,point))
    {
        deck = self.sourceDeck4;
    }
    if(!deck && CGRectContainsPoint(self.sourceDeck5.deckRect,point))
    {
        deck = self.sourceDeck5;
    }
    if(!deck && CGRectContainsPoint(self.sourceDeck6.deckRect,point))
    {
        deck = self.sourceDeck6;
    }
    if(!deck && CGRectContainsPoint(self.sourceDeck7.deckRect,point))
    {
        deck = self.sourceDeck7;
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
