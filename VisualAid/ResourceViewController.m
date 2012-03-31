//
//  ResourceViewController.m
//  VisualAid
//
//  Created by David Rodriguez on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import "ResourceViewController.h"

@implementation ResourceViewController
@synthesize dismissButton,resourceButton,logo,productType;

-(IBAction) dismiss{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction) listResources:(UIButton *) sender {
    ListViewController *list = [[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil];
    
    ResourceManager *manager = [[ResourceManager alloc]init];
    list.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    list.productType = self.productType;
    list.resourceType = [sender tag];
    [list setResourceIconForButtonTag:[sender tag]];

    
    UIImageView *logo2 = (UIImageView *)[list.view viewWithTag:99];
    NSString *imageName = [NSString stringWithFormat:@"logo%@.png", [manager nameOfProduct:self.productType]];
    [logo2 setImage:[UIImage imageNamed:imageName] ];
  
    
    
	[self presentModalViewController:list animated:YES];
    [manager release];
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
    [resourceButton release];
    [dismissButton release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
