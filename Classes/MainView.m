//
//  MainView.m
//  Solitaire
//
//  Created by Mac Mini on 5.9.2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"


@implementation MainView

@synthesize backgroundImage;
@synthesize fromPoint;
@synthesize toPoint;

-(id) initWithCoder:(NSCoder*)sourceCoder
{
	if( (self = [super initWithCoder:sourceCoder]))
	{
		// place any other initialization here
		backgroundImage = [UIImage imageNamed:@"club.png"];
		toPoint.x = 100;
		toPoint.y = 100;
	}
	return self;
}


-(void)drawRect:(CGRect)rect {
    CGContextRef    context = UIGraphicsGetCurrentContext();
	
	[[UIColor greenColor] set];
	UIRectFill(rect);
	
    CGPoint drawingTargetPoint = CGPointMake(toPoint.x,toPoint.y);
	[backgroundImage drawAtPoint:drawingTargetPoint];

	
}


-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touchPoint = [touches anyObject]; 
    CGPoint point = [touchPoint locationInView:self];   
	
	CGRect rect;
	rect.origin = toPoint;
	rect.size = backgroundImage.size; 

	if (CGRectContainsPoint(rect,point))
	{
		xCap =  point.x - toPoint.x;
		yCap = point.y - toPoint.y;
		
		
		[self setNeedsDisplay];
	}
	
	
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

	CGRect rect;
	rect.origin = toPoint;
    rect.size = backgroundImage.size; 	
	
	if (CGRectContainsPoint(rect,point))
	{
	toPoint.x = point.x - xCap;
	toPoint.y = point.y - yCap;
	
    [self setNeedsDisplay];
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
	
	CGRect rect;
	rect.origin = toPoint;
    rect.size = backgroundImage.size; 
	
	if (CGRectContainsPoint(rect,point))
	{
		
	toPoint.x = point.x - xCap;
	toPoint.y = point.y - yCap;
	
    [self setNeedsDisplay];
	}
}



@end
