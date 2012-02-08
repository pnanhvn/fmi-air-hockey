//
//  PlayerMenuViewControler.m
//  AirHockey
//
//  Created by Seshiro on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerMenuViewController.h"
#import "ViewController.h"
@implementation PlayerMenuViewController

@synthesize playerOneName = _playerOneName;
@synthesize playerTwoName = _playerTwoName;
@synthesize malletOneChoice = _malletOneChoice;
@synthesize malletTwoChoice = _malletTwoChoice;

-(IBAction)showPlaygroundView
{
    ViewController* playView = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    playView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:playView animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
