
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "MainView.h"


@implementation MainView

//@synthesize card;


-(id) initWithCoder:(NSCoder*)sourceCoder
{
	if( (self = [super initWithCoder:sourceCoder]))
	{
		cardArray = [[NSMutableArray alloc] init];
		for (int i=0;i<30;i++)
		{
			Card* c = [Card alloc];
			[c initWithData:@"club.png":i*20:i*20:0:0:i];
			[cardArray addObject:c];
			[c release];
			
		}
	}
	return self;
}


-(void)drawRect:(CGRect)rect {
    //CGContextRef    context = UIGraphicsGetCurrentContext();
	
    // Game background
	[[UIColor greenColor] set];
	UIRectFill(rect);
	
 	
	for(int i = 0 ; i < [cardArray count] ; i++)
	{
		Card* c = [cardArray objectAtIndex:i];
		CGPoint drawingTargetPoint = CGPointMake(c.cardRect.origin.x,c.cardRect.origin.y);
		[c.backgroundImage drawAtPoint:drawingTargetPoint];
		
	}
	
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
	
	activeCard = nil;
	
	for(int i = 0 ; i < [cardArray count] ; i++)
	{
		Card* c = [cardArray objectAtIndex:i];
		if (CGRectContainsPoint(c.cardRect,point))
		{
			xCap =  point.x - c.cardRect.origin.x;
			yCap = point.y - c.cardRect.origin.y;
			
			if (activeCard==nil)
			{
				activeCard = c;
			}
			else 
			{
                if (c.zOrder > activeCard.zOrder) 
                    activeCard = c;
			}
			
		}		
		
	}	
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
	
	if (activeCard != nil)
	{
		[activeCard setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
	
	if (activeCard!=nil)
	{
		[activeCard setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
		activeCard = nil;
	}
}



@end
