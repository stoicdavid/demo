//
//  HelperViewController.h
//  VisualAid
//
//  Created by David Rodriguez on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuickLook/QuickLook.h"

@interface HelperViewController : UIViewController <QLPreviewControllerDataSource,QLPreviewControllerDelegate> {
    
    
    NSString *documents;
    
}

@property (nonatomic, retain) NSString *documents;

-(IBAction) closeWindow: (id) sender;

-(NSInteger) numberOfPreviewItemsInPreviewController:(QLPreviewController *) controller;
- (id <QLPreviewItem>) previewController: (QLPreviewController *) controller previewItemAtIndex:(NSInteger)index;


@end


