
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "MainView.h"


@implementation MainView
@synthesize sourceDeckArray = _sourceDeckArray;
@synthesize targetDeckArray = _targetDeckArray;
@synthesize cardsArray = _cardsArray;
@synthesize wasteDeck1 = _wasteDeck1;
@synthesize wasteDeck2 = _wasteDeck2;



-(id) initWithCoder:(NSCoder*)sourceCoder
{
	if( (self = [super initWithCoder:sourceCoder]))
	{
        int screenWidth = self.bounds.size.width;
        //int screenHeight = self.bounds.size.height;
        int cardWidth = screenWidth / 9;
        int cardHeight = cardWidth * 1.7;
        int cap = (screenWidth - cardWidth*7) / 8;
        
        
        // Create cards
        self.cardsArray =  [[NSMutableArray alloc] init];
        [self createCards:cardWidth:cardHeight];
        
        // Array for the source decks
        self.sourceDeckArray = [[NSMutableArray alloc] init];
        
        // Source decks
        Deck* sourceDeck = [Deck alloc];
        [sourceDeck initWithData:cap:cardHeight*2:1:cardWidth:cardHeight:ESource];
		for (int i=0;i<=1;i++)
		{
            Card* card = [self getRandomCard];
            [sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        [[sourceDeck.cardArray lastObject] setTurned:true];
        [self.sourceDeckArray addObject:sourceDeck];
        [sourceDeck release];
        sourceDeck = nil;
        
        
        sourceDeck = [Deck alloc];
        [sourceDeck initWithData:cap*2+cardWidth:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<=2;i++)
		{
            Card* card = [self getRandomCard];
            [sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        [[sourceDeck.cardArray lastObject] setTurned:true];
        [self.sourceDeckArray addObject:sourceDeck];
        [sourceDeck release];
        sourceDeck = nil;

        
        sourceDeck = [Deck alloc];
        [sourceDeck initWithData:cap*3+cardWidth*2:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<=3;i++)
		{
            Card* card = [self getRandomCard];
            [sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        [[sourceDeck.cardArray lastObject] setTurned:true];
        [self.sourceDeckArray addObject:sourceDeck];
        [sourceDeck release];
        sourceDeck = nil;

        
        sourceDeck = [Deck alloc];
        [sourceDeck initWithData:cap*4+cardWidth*3:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<=4;i++)
		{
            Card* card = [self getRandomCard];
            [sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        [[sourceDeck.cardArray lastObject] setTurned:true];
        [self.sourceDeckArray addObject:sourceDeck];
        [sourceDeck release];
        sourceDeck = nil;

        
        sourceDeck = [Deck alloc];
        [sourceDeck initWithData:cap*5+cardWidth*4:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<=5;i++)
		{
            Card* card = [self getRandomCard];
            [sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        [[sourceDeck.cardArray lastObject] setTurned:true];
        [self.sourceDeckArray addObject:sourceDeck];
        [sourceDeck release];
        sourceDeck = nil;

        
        sourceDeck = [Deck alloc];
        [sourceDeck initWithData:cap*6+cardWidth*5:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<=6;i++)
		{
            Card* card = [self getRandomCard];
            [sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        [[sourceDeck.cardArray lastObject] setTurned:true];
        [self.sourceDeckArray addObject:sourceDeck];
        [sourceDeck release];
        sourceDeck = nil;

        
        sourceDeck = [Deck alloc];
        [sourceDeck initWithData:cap*7+cardWidth*6:cardHeight*2:2:cardWidth:cardHeight:ESource];
		for (int i=0;i<=7;i++)
		{
            Card* card = [self getRandomCard];
            [sourceDeck addCard:card];
            [card release];
            card = nil;
		}
        [[sourceDeck.cardArray lastObject] setTurned:true];
        [self.sourceDeckArray addObject:sourceDeck];
        [sourceDeck release];
        sourceDeck = nil;
        
        
        
        
        // Array for the target decks
        self.targetDeckArray = [[NSMutableArray alloc] init];
        
        // Target decks
        Deck* targetDeck = [Deck alloc];
        [targetDeck initWithData:cap*4+cardWidth*3:cardHeight*0.5:2:cardWidth:cardHeight:ETarget];
		for (int i=0;i<=1;i++)
		{
            Card* card = [self getRandomCard];
            [targetDeck addCard:card];
            [card release];
            card = nil;
		}
        [self.targetDeckArray addObject:targetDeck];
        [targetDeck release];
        targetDeck = nil;

 
        targetDeck = [Deck alloc];
        [targetDeck initWithData:cap*5+cardWidth*4:cardHeight*0.5:2:cardWidth:cardHeight:ETarget];
		for (int i=0;i<=1;i++)
		{
            Card* card = [self getRandomCard];
            [targetDeck addCard:card];
            [card release];
            card = nil;
		}
        [self.targetDeckArray addObject:targetDeck];
        [targetDeck release];
        targetDeck = nil;

        targetDeck = [Deck alloc];
        [targetDeck initWithData:cap*6+cardWidth*5:cardHeight*0.5:2:cardWidth:cardHeight:ETarget];
		for (int i=0;i<=1;i++)
		{
            Card* card = [self getRandomCard];
            [targetDeck addCard:card];
            [card release];
            card = nil;
		}
        [self.targetDeckArray addObject:targetDeck];
        [targetDeck release];
        targetDeck = nil;
        
        targetDeck = [Deck alloc];
        [targetDeck initWithData:cap*7+cardWidth*6:cardHeight*0.5:2:cardWidth:cardHeight:ETarget];
		for (int i=0;i<=1;i++)
		{
            Card* card = [self getRandomCard];
            [targetDeck addCard:card];
            [card release];
            card = nil;
		}
        [self.targetDeckArray addObject:targetDeck];
        [targetDeck release];
        targetDeck = nil;
        
        
        // Waste decks
        self.wasteDeck1 = [Deck alloc];
        [self.wasteDeck1 initWithData:cap:cardHeight*0.5:2:cardWidth:cardHeight:EWaste1];
		for (int i=0;i<=5;i++)
		{
            Card* card = [self getRandomCard];
            [self.wasteDeck1 addCard:card];
            [card release];
            card = nil;
		}
        self.wasteDeck2 = [Deck alloc];
        [self.wasteDeck2 initWithData:cap*2+cardWidth:cardHeight*0.5:2:cardWidth:cardHeight:EWaste2];
		for (int i=0;i<=1;i++)
		{
            Card* card = [self getRandomCard];
            [self.wasteDeck2 addCard:card];
            [card release];
            card = nil;
		}
        
        
        
	}
	return self;
}

- (void)dealloc {
	[_sourceDeckArray release];
    _sourceDeckArray = nil;
        
    [_wasteDeck1 release];
    _wasteDeck1 = nil;
    
    [_wasteDeck2 release];
    _wasteDeck2 = nil;
    
    [_cardsArray release];
    _cardsArray = nil;
    
    _activeCard = nil;
    
	// Remember to call base class dealloc
    [super dealloc];
}


-(void)createCards:(int)width:(int)height
{
    for (int i=1;i<=13;i++) {
        Card* card = [Card alloc];
        NSString* name = [[NSString alloc]initWithFormat:@"club%d.png",i];
        [card initWithData:EClub:name:0:0:0:0:i:width:height];
        [self.cardsArray addObject:card];
        
        [card release];
        card = nil;
        [name release];
        name = nil;
    }

    for (int i=1;i<=13;i++) {
        Card* card = [Card alloc];
        NSString* name = [[NSString alloc]initWithFormat:@"diamond%d.png",i];
        [card initWithData:EDiamond:name:0:0:0:0:i:width:height];
        [self.cardsArray addObject:card];
        
        [card release];
        card = nil;
        [name release];
        name = nil;
    }
    
    for (int i=1;i<=13;i++) {
        Card* card = [Card alloc];
        NSString* name = [[NSString alloc]initWithFormat:@"heart%d.png",i];
        [card initWithData:EHeart:name:0:0:0:0:i:width:height];
        [self.cardsArray addObject:card];
        
        [card release];
        card = nil;
        [name release];
        name = nil;
    }
    
    for (int i=1;i<=13;i++) {
        Card* card = [Card alloc];
        NSString* name = [[NSString alloc]initWithFormat:@"spade%d.png",i];
        [card initWithData:ESpade:name:0:0:0:0:i:width:height];
        [self.cardsArray addObject:card];
        
        [card release];
        card = nil;
        [name release];
        name = nil;
    }
    
    
}


-(Card*)getRandomCard
{
    Card* ret = nil;
    
    int max = ([self.cardsArray count]-1);
    int r = arc4random() % max;
    
    if(r<0)
        r = 0;
    
    //NSLog(@"r = %d, max = %d", r, max);
    
    ret = [self.cardsArray objectAtIndex:r];    
    [ret retain];
    [self.cardsArray removeObject:ret];
    
    return ret;
}

-(void)drawRect:(CGRect)rect {
    //CGContextRef    context = UIGraphicsGetCurrentContext();
	
    // Game background
	[[UIColor greenColor] set];
	UIRectFill(rect);
	
    // Draw decks
    for(Deck* deck in self.sourceDeckArray)
    {
        [deck drawDeck];
    }
    for(Deck* deck in self.targetDeckArray)
    {
        [deck drawDeck];
    }
    [self.wasteDeck1 drawDeck];
	[self.wasteDeck2 drawDeck];
    
    // Draw active card on top of all others
	if (_activeCard)
	{
		[_activeCard drawCard];		
	}
	
}

-(Card*)findActiveCard:(CGPoint)point
{
    Card* card = nil;
    
    for(Deck* deck in self.sourceDeckArray)
    {
        card = [deck getCardAtPos:point];
        if (card) {
            return card;
        }
        card = nil;
    }    

    if(!card)
        card = [self.wasteDeck1 getCardAtPos:point];
    
    
    if(!card)
        card = [self.wasteDeck2 getCardAtPos:point];
    
    return card;
}

-(Deck*)findActiveDeck:(CGPoint)point
{
    Deck* ret = nil;
    
    for(Deck* deck in self.sourceDeckArray)
    {
        if(CGRectContainsPoint(deck.deckRect,point))
        {
            ret = deck;
            return ret;
        }
    }    
    for(Deck* deck in self.targetDeckArray)
    {
        if(CGRectContainsPoint(deck.deckRect,point))
        {
            ret = deck;
            return ret;
        }
    }    
    
    
    return ret;
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touchPoint = [touches anyObject]; 
    CGPoint point = [touchPoint locationInView:self];   
	
    _activeCard = [self findActiveCard:point];
    // Handle source deck and waste2 touch
    if (_activeCard && ([[_activeCard ownerDeck]deckType] == ESource ||
        [[_activeCard ownerDeck]deckType] == EWaste2))
    {
        xCap = point.x - _activeCard.cardRect.origin.x;
        yCap = point.y - _activeCard.cardRect.origin.y;
        
        [_activeCard storeCurrentPos];
	}
    // Handle waste1 deck touch
    else if (_activeCard && [[_activeCard ownerDeck]deckType] == EWaste1) {
        [_activeCard changeDeckTo:_activeCard.ownerDeck:_wasteDeck2];
        _activeCard = nil;
        [self setNeedsDisplay];
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
            // TODO: add game logic
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
