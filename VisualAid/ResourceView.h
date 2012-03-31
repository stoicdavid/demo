//
//  ResourceView.h
//  VisualAid
//
//  Created by Alejandro on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ResourceView : UIButton {
    NSString *fileName;
    ListViewController *localResponder;
    BOOL downloadedContent;
}

@property (nonatomic) BOOL downloadedContent;
@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) ListViewController *localResponder;

- (id) initWithFrame:(CGRect)frame 
  withLocalResponder:(UIViewController*)controller
           withTitle:(NSString*)title 
            fileName:(NSString*)fileName
andDownloadedContent:(BOOL)downloaded;

- (void) activate;
- (void) deactivate;
- (void) invokeControllerViewPush;

@end
