//
//  ViewController.m
//  VisualAid
//
//  Created by David Rodriguez on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize productButton;

-(IBAction) openResources:(UIButton *) sender
{
    
    ResourceViewController *resource = [[ResourceViewController alloc] initWithNibName:@"ResourceViewController" bundle:nil];
    resource.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    
    ResourceManager *manager = [[ResourceManager alloc]init];

    UIImageView *logo = (UIImageView *)[resource.view viewWithTag:99];
    NSString *imageName = [NSString stringWithFormat:@"logo%@.png", [manager nameOfProduct:sender.tag]];
    [logo setImage:[UIImage imageNamed:imageName]];
    resource.logo = logo;
    resource.productType=sender.tag;
    

    if (![manager productHasVisualAids:sender.tag]){
        UIButton *res = (UIButton *)[resource.view viewWithTag:1];
        //res.alpha = 0.5;
        res.enabled=NO;
    }

    if (![manager productHasExtras:sender.tag]){
        UIButton *res = (UIButton *)[resource.view viewWithTag:2];
        //res.alpha = 0.5;
        res.enabled=NO;
    }

    if (![manager productHasVideos:sender.tag]){
        UIButton *res = (UIButton *)[resource.view viewWithTag:3];
        //res.alpha = 0.5;
        res.enabled=NO;
    }

    
	[self presentModalViewController:resource animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [productButton release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
