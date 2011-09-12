
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "MainView.h"


@implementation MainView

@synthesize sourceDeck = _sourceDeck;
@synthesize activeCard = _activeCard;

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
    
    [_activeCard release];
    _activeCard = nil;
    
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
	if (self.activeCard)
	{
		CGPoint drawingTargetPoint = CGPointMake(self.activeCard.cardRect.origin.x,
                                                 self.activeCard.cardRect.origin.y);
		[self.activeCard.backgroundImage drawAtPoint:drawingTargetPoint];
		
	}
	
}


-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touchPoint = [touches anyObject]; 
    CGPoint point = [touchPoint locationInView:self];   
	
    self.activeCard = [self.sourceDeck getCardAtPos:point];
    if (self.activeCard)
    {
        xCap = point.x - self.activeCard.cardRect.origin.x;
        yCap = point.y - self.activeCard.cardRect.origin.y;
	}
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (self.activeCard)
	{
        UITouch* touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
		[self.activeCard setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{	
	if (self.activeCard)
	{
        UITouch* touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
		[self.activeCard setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
		self.activeCard = nil;
	}
    
}



@end
