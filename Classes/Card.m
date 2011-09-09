
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND

#import "Card.h"


@implementation Card

@synthesize backgroundImage;
@synthesize cardRect;
@synthesize cardId;
@synthesize cardLand;
@synthesize isTurned;
@synthesize cardParent;
@synthesize zOrder;


- (id)initWithData:(NSString*)cardName:(int)x:(int)y:(int)cId:(int)cLand:(int)z
{
	self = [super init];

	
	//backgroundImage = [UIImage imageNamed:@"club.png"];
	backgroundImage = [UIImage imageNamed:cardName];
	
	CGPoint point;
	point.x = x;
	point.y = y;
	cardRect.origin = point;
	cardRect.size = backgroundImage.size; 
	zOrder = z;
	
	return self;
	
}

- (void)setPos:(int)x:(int)y
{
	CGPoint point;
	point.x = x;
	point.y = y;
	cardRect.origin = point;
	
}




@end
