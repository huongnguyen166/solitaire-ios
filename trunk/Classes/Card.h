
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>


@interface Card : NSObject {
	UIImage* _backgroundImage;
	CGRect _cardRect;
	int _cardId;
	int _cardLand;
	BOOL _isTurned;
	Card* _cardParent;
	int _zOrder;
	
}
- (id)initWithData:(NSString*)cardName:(int)x:(int)y:(int)cId:(int)cLand:(int)z;
- (void)setPos:(int)x:(int)y;
- (void)dealloc;


@property (nonatomic, retain) UIImage* backgroundImage;
@property CGRect cardRect;
@property int cardId;
@property int cardLand;
@property BOOL isTurned;
@property (nonatomic, retain) Card* cardParent;
@property int zOrder;

@end
