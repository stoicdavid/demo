//
//  ListViewController.h
//  VisualAid
//
//  Created by David Rodriguez on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResourceManager.h"

#define pdf     @"pdf"
#define video   @"m4v"

@interface ListViewController : UIViewController
{
    UIButton *dismissButton;
    UIButton *downloadButton;
    UITableView *table;
    NSMutableDictionary *resourceList;
    NSString *fileType;
    int productType;
    int resourceType;
    UIImageView *logo;
    UIProgressView *progress;
    UILabel *metrics;
    NSDate *date1;
    NSDate *date2;    

    
}

@property (nonatomic) int productType;
@property (nonatomic) int resourceType;
@property (nonatomic,retain) NSDate *date1;
@property (nonatomic,retain) NSDate *date2;
@property (nonatomic, retain) UIButton *dismissButton;
@property (nonatomic, retain) IBOutlet UIButton *downloadButton;
@property (nonatomic, retain) IBOutlet UIImageView *logo;
@property (nonatomic, retain) IBOutlet UIProgressView *progress;
@property (nonatomic, retain) IBOutlet UILabel *metrics;
@property (nonatomic, retain) NSMutableDictionary *resourceList;
@property (nonatomic, retain) NSString *fileType;




-(IBAction) dismiss;
-(IBAction) downloadContent;

- (void) addDeleteButton:(NSString *)fileName positionY:(int) yPos_;
- (void) setResourceIconForButtonTag:(int)tag;
- (void) pushResourceViewControllerWithFile:(NSString*)file;

@end
