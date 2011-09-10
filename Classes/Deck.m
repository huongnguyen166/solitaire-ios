//
//  Deck.m
//  Solitaire
//
//  Created by Mac Mini on 10.9.2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Deck.h"


@implementation Deck

@synthesize cardArray;
@synthesize deckId;
@synthesize deckRect;


- (id)initWithData:(int)x:(int)y:(int)dId
{
	self = [super init];
    
    if (self)
    {
        cardArray = [[NSMutableArray alloc] init];
        UIImage* backgroundImage = [UIImage imageNamed:@"Club_ace.png"];
        deckId = dId;
        CGPoint point;
        point.x = x;
        point.y = y;
        deckRect.origin = point;
        deckRect.size = backgroundImage.size; 
        [backgroundImage release];
        
    }
    
    return self;
}

- (void)dealloc {
	[cardArray release];
	[super dealloc];
}

- (void)addCard:(Card*)card
{
    [card setPos:deckRect.origin.x:deckRect.origin.y];
    [cardArray addObject:card];
    [card release];
}

- (void)removeCard:(Card*)card
{
    // TODO:
}

-(void)drawDeck 
{
 	for(int i = 0 ; i < [cardArray count] ; i++)
	{
		Card* c = [cardArray objectAtIndex:i];
		CGPoint drawingTargetPoint = CGPointMake(c.cardRect.origin.x,c.cardRect.origin.y);
		[c.backgroundImage drawAtPoint:drawingTargetPoint];
		
	}
	
}

- (Card*)getCardAtPos:(CGPoint)point
{
    Card* activeCard = nil;
    for(int i = 0 ; i < [cardArray count] ; i++)
    {
        Card* c = [[cardArray objectAtIndex:i]retain]; // TODO: copy,retain,assign?
//        Card* c = [cardArray objectAtIndex:i];
        if (CGRectContainsPoint(c.cardRect,point))
        {
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
	return activeCard;
}

@end
