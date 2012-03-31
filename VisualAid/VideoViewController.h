//
//  VideoViewController.h
//  VisualAid
//
//  Created by Alejandro on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController : UIViewController {
    NSString *currentVideo;
    MPMoviePlayerController *player;
}
    
@property (nonatomic, retain) NSString* currentVideo;
@property (nonatomic, retain) MPMoviePlayerController *player;

- (id) initWithFrame:(CGRect)frame withFileToPlay:(NSString*)file;

@end
