//
//  VideoViewController.m
//  VisualAid
//
//  Created by Alejandro on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import "VideoViewController.h"

@implementation VideoViewController

@synthesize currentVideo, player;

- (id) initWithFrame:(CGRect)frame withFileToPlay:(NSString*)file {
    if ((self = [super init])) {
        self.currentVideo = file;
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
    [self.view setBackgroundColor:[UIColor colorWithWhite:50 alpha:0.5]];

    player = [[MPMoviePlayerController alloc] initWithContentURL:
              [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:currentVideo ofType:@"mp4"]]];
    player.shouldAutoplay = NO;
    
    int width = 1024;
    int height = 768;
    [player.view setFrame:CGRectMake((width/2)-300, (height/2)-200, 600, 400)];
    [self.view addSubview:player.view];
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
	return YES;
}

@end
