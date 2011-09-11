
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "MainView.h"


@implementation MainView



-(id) initWithCoder:(NSCoder*)sourceCoder
{
	if( (self = [super initWithCoder:sourceCoder]))
	{
        sourceDeck = [Deck alloc];
        [sourceDeck initWithData:50:50:1];
		for (int i=0;i<30;i++)
		{
			Card* card = [Card alloc];
            [card initWithData:@"Club_ace.png":0:0:0:0:1];
            [sourceDeck addCard:card];
            [card release];
            card = nil;
		}
	}
	return self;
}

- (void)dealloc {
	[sourceDeck release];
    sourceDeck = nil;
    
    [activeCard release];
    activeCard = nil;
    
	// Remember to call base class dealloc
    [super dealloc];
}


-(void)drawRect:(CGRect)rect {
    //CGContextRef    context = UIGraphicsGetCurrentContext();
	
    // Game background
	[[UIColor greenColor] set];
	UIRectFill(rect);
	
    // Draw decks
    [sourceDeck drawDeck];
	
    // Draw active card on top of all others
	if (activeCard)
	{
		CGPoint drawingTargetPoint = CGPointMake(activeCard.cardRect.origin.x,activeCard.cardRect.origin.y);
		[activeCard.backgroundImage drawAtPoint:drawingTargetPoint];
		
	}
	
}


-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touchPoint = [touches anyObject]; 
    CGPoint point = [touchPoint locationInView:self];   
	
    activeCard = [sourceDeck getCardAtPos:point];
    if (activeCard)
    {
        xCap =  point.x - activeCard.cardRect.origin.x;
        yCap = point.y - activeCard.cardRect.origin.y;
	}
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (activeCard)
	{
        UITouch* touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
		[activeCard setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{	
	if (activeCard)
	{
        UITouch* touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
		[activeCard setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
		activeCard = nil;
	}
    
}



@end
