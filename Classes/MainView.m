
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
		
		card = [Card alloc];
		[card initWithData:@"club.png":50:50:0:0];
		
		
	}
	return self;
}


-(void)drawRect:(CGRect)rect {
    CGContextRef    context = UIGraphicsGetCurrentContext();
	
	[[UIColor greenColor] set];
	UIRectFill(rect);
	
    CGPoint drawingTargetPoint = CGPointMake(card.cardRect.origin.x,card.cardRect.origin.y);

	[card.backgroundImage drawAtPoint:drawingTargetPoint];
	
	
}


-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touchPoint = [touches anyObject]; 
    CGPoint point = [touchPoint locationInView:self];   
	
	if (CGRectContainsPoint(card.cardRect,point))
	{
		xCap =  point.x - card.cardRect.origin.x;
		yCap = point.y - card.cardRect.origin.y;
		
		
		[self setNeedsDisplay];
	}
	
	
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
 	
	
	if (CGRectContainsPoint(card.cardRect,point))
	{
		[card setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
	
	
	if (CGRectContainsPoint(card.cardRect,point))
	{
		[card setPos:point.x - xCap:point.y - yCap];
		[self setNeedsDisplay];
	}
}



@end
