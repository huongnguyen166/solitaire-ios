
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>


@interface Card : NSObject {
	UIImage* backgroundImage;
	CGRect cardRect;
	int cardId;
	int cardLand;
	BOOL isTurned;
	Card* cardParent;
	int zOrder;
	
}
- (id)initWithData:(NSString*)cardName:(int)x:(int)y:(int)cId:(int)cLand:(int)z;
- (void)setPos:(int)x:(int)y;



@property UIImage* backgroundImage;
@property CGRect cardRect;
@property int cardId;
@property int cardLand;
@property BOOL isTurned;
@property Card* cardParent;
@property int zOrder;

@end
