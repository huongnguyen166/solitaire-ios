
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "MainView.h"


@implementation MainView

@synthesize sourceDeck = _sourceDeck;
//@synthesize activeCard = _activeCard;

-(id) initWithCoder:(NSCoder*)sourceCoder
{
	if( (self = [super initWithCoder:sourceCoder]))
	{
        self.sourceDeck = [Deck alloc];
        [self.sourceDeck initWithData:50:50:1];
		for (int i=0;i<3;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:i];
            [self.sourceDeck addCard:card];
            [card release];
            card = nil;
		}
	}
	return self;
}

- (void)dealloc {
	[_sourceDeck release];
    _sourceDeck = nil;
    
    //[_activeCard release];
    //_activeCard = nil;
    
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
	
    // Draw active card on top of all others
	if (_activeCard)
	{
		CGPoint drawingTargetPoint = CGPointMake(_activeCard.cardRect.origin.x,
                                                 _activeCard.cardRect.origin.y);
		[_activeCard.backgroundImage drawAtPoint:drawingTargetPoint];
		
	}
	
}


-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touchPoint = [touches anyObject]; 
    CGPoint point = [touchPoint locationInView:self];   
	
    _activeCard = [self.sourceDeck getCardAtPos:point];
    if (_activeCard)
    {
        xCap = point.x - _activeCard.cardRect.origin.x;
        yCap = point.y - _activeCard.cardRect.origin.y;
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
		[self setNeedsDisplay];
		_activeCard = nil;
	}
    
}



@end
