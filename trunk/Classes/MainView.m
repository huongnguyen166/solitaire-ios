
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
		for (int i=0;i<10;i++)
		{
			Card* c = [Card alloc];
			[c initWithData:@"club.png":i*20:i*20:0:0];
			[cardArray addObject:c];
			[c release];
			
		}
			 
		//card = [Card alloc];
		//[card initWithData:@"club.png":50:50:0:0];
		
		
		
	}
	return self;
}


-(void)drawRect:(CGRect)rect {
    CGContextRef    context = UIGraphicsGetCurrentContext();
	
	[[UIColor greenColor] set];
	UIRectFill(rect);
	
    //CGPoint drawingTargetPoint = CGPointMake(card.cardRect.origin.x,card.cardRect.origin.y);
	//[card.backgroundImage drawAtPoint:drawingTargetPoint];
	
	
	for(int i = 0 ; i < [cardArray count] ; i++)
	{
		Card* c = [cardArray objectAtIndex:i];
		CGPoint drawingTargetPoint = CGPointMake(c.cardRect.origin.x,c.cardRect.origin.y);
		[c.backgroundImage drawAtPoint:drawingTargetPoint];
		
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
			activeCard = c;
			break;
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
