//
//  MainView.h
//  Solitaire
//
//  Created by Mac Mini on 5.9.2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import <UIKit/UIKit.h>
//#import <CoreData/CoreData.h>



@interface MainView : UIView {
	UIImage* backgroundImage;
	CGPoint fromPoint;
    CGPoint toPoint;
	int xCap;
	int yCap;
	
}

-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;



@property UIImage* backgroundImage;
@property CGPoint fromPoint;
@property CGPoint toPoint;

@end
