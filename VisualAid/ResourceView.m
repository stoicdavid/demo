//
//  ResourceView.m
//  VisualAid
//
//  Created by Alejandro on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import "ResourceView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ResourceView

@synthesize fileName, localResponder,downloadedContent;

- (id) initWithFrame:(CGRect)frame withLocalResponder:(ListViewController *)controller withTitle:(NSString*)title fileName:(NSString*)fileName_ andDownloadedContent:(BOOL)downloaded
{
    if ((self = [super initWithFrame:frame])) {
        self.fileName = fileName_;
        [self setTitle:title forState:UIControlStateNormal];
        [[self titleLabel] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        [[self layer] setBackgroundColor:[UIColor colorWithWhite:6.0 alpha:0.4].CGColor];
        [[self layer] setBorderColor:[UIColor colorWithWhite:10.0 alpha:0.8].CGColor];
        [[self layer] setBorderWidth:1]; 
        [[self layer] setShadowRadius: 5.0];
        [[self layer] setShadowOffset: CGSizeMake(0, 2)];
        [[self layer] setShadowColor: [UIColor blackColor].CGColor];
        [[self layer] setShadowOpacity: 0.6];
        [[self layer] setCornerRadius: 5];
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);


        [self setTitleColor:UIColorFromRGB(0x524D46) forState:UIControlStateNormal];
        
        [self setLocalResponder:controller];
        
        [self addTarget:self action:@selector(deactivate) forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
        [self addTarget:self action:@selector(activate) forControlEvents:UIControlEventTouchDown];
        
        [self addTarget:self action:@selector(invokeControllerViewPush) 
       forControlEvents:UIControlEventTouchUpInside];
        




        
        
    }
    return self;
}

- (void) invokeControllerViewPush
{

    [localResponder performSelector:@selector(pushResourceViewControllerWithFile:) withObject:fileName];
}

- (void) activate {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [[self layer] setBackgroundColor:UIColorFromRGB(0xA34568).CGColor];
    [self setTitleColor:UIColorFromRGB(0xFE921C) forState:UIControlStateNormal];

    [UIView commitAnimations];

}

- (void) deactivate {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [[self layer] setBackgroundColor:[UIColor colorWithWhite:6.0 alpha:0.4].CGColor];
    [self setTitleColor:UIColorFromRGB(0x524D46) forState:UIControlStateNormal];

    [UIView commitAnimations];
}

         
@end
