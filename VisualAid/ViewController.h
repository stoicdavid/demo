//
//  ViewController.h
//  VisualAid
//
//  Created by David Rodriguez on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResourceViewController.h"
#import "ResourceManager.h"
@interface ViewController : UIViewController
{
    UIButton *productButton;
}

@property (nonatomic, retain) UIButton *productButton;

-(IBAction) openResources:(UIButton *)sender;

@end
