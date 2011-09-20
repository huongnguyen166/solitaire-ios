
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "MainView.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


@implementation MainView
@synthesize sourceDeckArray = _sourceDeckArray;
@synthesize targetDeckArray = _targetDeckArray;
@synthesize cardsArray = _cardsArray;
@synthesize wasteDeck1 = _wasteDeck1;
@synthesize wasteDeck2 = _wasteDeck2;
@synthesize backgroundImage = _backgroundImage;



-(id) initWithCoder:(NSCoder*)sourceCoder
{
	if( (self = [super initWithCoder:sourceCoder]))
	{
        int screenWidth = self.bounds.size.width;
        //int screenHeight = self.bounds.size.height;
        int cardWidth = screenWidth / 9;
        int cardHeight = cardWidth * 1.7;
        int cap = (screenWidth - cardWidth*7) / 8;
        
        self.backgroundImage = [UIImage imageNamed:@"background.png"];
        
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
        [self.targetDeckArray addObject:targetDeck];
        [targetDeck release];
        targetDeck = nil;

 
        targetDeck = [Deck alloc];
        [targetDeck initWithData:cap*5+cardWidth*4:cardHeight*0.5:2:cardWidth:cardHeight:ETarget];
        [self.targetDeckArray addObject:targetDeck];
        [targetDeck release];
        targetDeck = nil;

        targetDeck = [Deck alloc];
        [targetDeck initWithData:cap*6+cardWidth*5:cardHeight*0.5:2:cardWidth:cardHeight:ETarget];
        [self.targetDeckArray addObject:targetDeck];
        [targetDeck release];
        targetDeck = nil;
        
        targetDeck = [Deck alloc];
        [targetDeck initWithData:cap*7+cardWidth*6:cardHeight*0.5:2:cardWidth:cardHeight:ETarget];
        [self.targetDeckArray addObject:targetDeck];
        [targetDeck release];
        targetDeck = nil;
        
        
        // Waste decks
        self.wasteDeck1 = [Deck alloc];
        [self.wasteDeck1 initWithData:cap:cardHeight*0.5:2:cardWidth:cardHeight:EWaste1];
        while ([self.cardsArray count] > 0) {
            Card* card = [self getRandomCard];
            [self.wasteDeck1 addCard:card];
            [card release];
            card = nil;
        }
        
        self.wasteDeck2 = [Deck alloc];
        [self.wasteDeck2 initWithData:cap*2+cardWidth:cardHeight*0.5:2:cardWidth:cardHeight:EWaste2];
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
    
    [_backgroundImage release];
    _backgroundImage = nil;
    
    _activeCard = nil;
    
	// Remember to call base class dealloc
    [super dealloc];
}


-(void)createCards:(int)width:(int)height
{
    for (int i=1;i<=13;i++) {
        Card* card = [Card alloc];
        [card setBlack:true];
        NSString* name = [NSString stringWithFormat:@"club%d.png",i];
        [card initWithData:EClub:name:0:0:i:i:width:height];
        [self.cardsArray addObject:card];
        
        [card release];
        card = nil;
    }

    for (int i=1;i<=13;i++) {
        Card* card = [Card alloc];
        [card setBlack:false];
        NSString* name = [NSString stringWithFormat:@"diamond%d.png",i];
        [card initWithData:EDiamond:name:0:0:i:i:width:height];
        [self.cardsArray addObject:card];
        
        [card release];
        card = nil;
    }
    
    for (int i=1;i<=13;i++) {
        Card* card = [Card alloc];
        [card setBlack:false];
        NSString* name = [NSString stringWithFormat:@"heart%d.png",i];
        [card initWithData:EHeart:name:0:0:i:i:width:height];
        [self.cardsArray addObject:card];
        
        [card release];
        card = nil;
    }
    
    for (int i=1;i<=13;i++) {
        Card* card = [Card alloc];
        [card setBlack:true];
        NSString* name = [NSString stringWithFormat:@"spade%d.png",i];
        [card initWithData:ESpade:name:0:0:i:i:width:height];
        [self.cardsArray addObject:card];
        
        [card release];
        card = nil;
    }
    
    
}


-(Card*)getRandomCard
{
    Card* ret = nil;
    int r = -1;
            
    int max = ([self.cardsArray count]-1);
    if (max>0)
        r = arc4random() % max;
    
    if(r<0)
        r = 0;
    
    //NSLog(@"r = %d, max = %d", r, max);
    
    ret = [self.cardsArray objectAtIndex:r];    
    [ret retain];
    [self.cardsArray removeObject:ret];
    
    return ret;
}

-(void)drawRect:(CGRect)rect {
    
    CGContextRef    context = UIGraphicsGetCurrentContext();
    
    // Disable antialias
    //CGContextSetShouldAntialias(context,false);
    
    // Draw background green color
    [RGB(0, 100, 0) set];
	UIRectFill(rect);
    
    // Draw background image
    //[self.backgroundImage drawInRect:self.bounds];
    //[self.backgroundImage drawInRect:rect];
    
    
    
    // Draw decks
    for(Deck* deck in self.sourceDeckArray)
    {
        [deck drawDeck:rect];
    }
    for(Deck* deck in self.targetDeckArray)
    {
        [deck drawDeck:rect];
    }
    [self.wasteDeck1 drawDeck:rect];
	[self.wasteDeck2 drawDeck:rect];
    
    
    // Draw active card on top of all others
	if (_activeCard)
	{
        // Make Shadow
        CGSize myShadowOffset = CGSizeMake(-10,10);
        CGContextSaveGState(context);
        CGContextSetShadow(context, myShadowOffset,5);
        
        
        // Draw the card(s)
        [_activeCard drawMeAndParentCard];
		
        CGContextRestoreGState(context);
        
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
	
    _prevPoint = point;
    
    _activeCard = [self findActiveCard:point];
    // Handle source deck and waste2 touch
    if (_activeCard && ([[_activeCard ownerDeck]deckType] == ESource ||
                        [[_activeCard ownerDeck]deckType] == EWaste2)) {
        if (_activeCard.cardParent == nil || 
            (_activeCard.cardParent && _activeCard.cardParent.turned && _activeCard.turned)) {
            xCap = point.x - _activeCard.cardRect.origin.x;
            yCap = point.y - _activeCard.cardRect.origin.y;
            [_activeCard setTurned: true];
            [_activeCard storeCurrentPos];
        } else {
            _activeCard = nil;
        }
        
	}
    // Handle waste1 deck touch
    else if (_activeCard && [[_activeCard ownerDeck]deckType] == EWaste1) {
        [_activeCard setTurned: true];
        [_activeCard changeDeckTo:_activeCard.ownerDeck:_wasteDeck2];
        _activeCard = nil;
        [self setNeedsDisplay];
    }
    // Empty waste1 deck touch
    else if(!_activeCard && CGRectContainsPoint(self.wasteDeck1.deckRect,point)) {
        // Copy all cards from wast2 back to waste1
        if ([self.wasteDeck2.cardArray count]>0) {
            
            Card* c = [self.wasteDeck2.cardArray objectAtIndex:0];
            // That handles all copying
            [c changeDeckTo:self.wasteDeck2 :self.wasteDeck1];
            c = nil;
        }
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
		
        //[self setNeedsDisplay];

        // Optimize drawing with clipping when user moves cards
        int x = ABS(_prevPoint.x - point.x) + 15;
        int y = ABS(_prevPoint.y - point.y) + 15;
        _prevPoint = point;
        CGRect rect;
        rect = _activeCard.cardRect;
        rect.origin.x -= x;
        rect.origin.y -= y;
        rect.size.width += x*2;
        rect.size.height = self.bounds.size.height;
        [self setNeedsDisplayInRect:rect];
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
            Card* onTopOfCard = [toDeck getTopCard];
            BOOL acceptMove = [self acceptCardMove:_activeCard.ownerDeck:toDeck:onTopOfCard];
            if(acceptMove) {
                NSLog(@"accept");
                // From deck to new deck
                BOOL ret = [_activeCard changeDeckTo:_activeCard.ownerDeck:toDeck];
                if (!ret) {
                    [_activeCard cancelMove];
                }
            } else {
                NSLog(@"no");
                [_activeCard cancelMove];
            }
        } else {
            [_activeCard cancelMove];
        }
    
        
        [self setNeedsDisplay];
		_activeCard = nil;
        toDeck = nil;
	}
}

-(BOOL)acceptCardMove:(Deck*)from:(Deck*)to:(Card*)onTopOfCard
{
    
    if (onTopOfCard && !onTopOfCard.turned)
        return false;
     
    if (from.deckType != ESource && from.deckType != EWaste2)
        return false;
    
 
    if (to.deckType != ESource && to.deckType != ETarget)
        return false;
    
    if (to == from) {
        return false;
    }
    
    
    if ([to.cardArray count]>0) {
        if (to.deckType == ESource) {
            if(_activeCard.cardType == onTopOfCard.cardType || 
               onTopOfCard.cardId != _activeCard.cardId+1 || 
                onTopOfCard.black == _activeCard.black) {
                    return false;
            }            
        } else if (to.deckType == ETarget) {
            if(onTopOfCard.cardId+1 != _activeCard.cardId ||
               onTopOfCard.cardType != _activeCard.cardType) {
                return false;
            }
        }   
    } else {
        if(_activeCard.cardId != 13 && to.deckType == ESource)
            return false;
        
        if(to.deckType == ETarget && _activeCard.cardId != 1)
            return false;
    }
    
    
    return true;
}



@end
