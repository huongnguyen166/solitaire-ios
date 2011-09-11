
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

    if (self)
    {
    // Load card graphics
	backgroundImage = [UIImage imageNamed:cardName];
	
    // Set card position and z order
	CGPoint point;
	point.x = x;
	point.y = y;
	cardRect.origin = point;
	cardRect.size = backgroundImage.size; 
	zOrder = z;
    }
	
	return self;
}

- (void)dealloc {
	[backgroundImage release];
    backgroundImage = nil;

	// Remember to call base class dealloc
    [super dealloc];
}

- (void)setPos:(int)x:(int)y
{
	CGPoint point;
	point.x = x;
	point.y = y;
	cardRect.origin = point;
}




@end
