
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import "SolitaireViewController.h"
#import "MainView.h"

@implementation SolitaireViewController


- (void)viewWillAppear:(BOOL)animated
{
    // Set card positions just before MainView will appear
    MainView* mv = (MainView*)self.view;
    [mv setPositions];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
