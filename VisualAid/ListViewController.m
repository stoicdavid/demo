//
//  ListViewController.m
//  VisualAid
//
//  Created by David Rodriguez on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import "ListViewController.h"
#import "ResourceView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "HelperViewController.h"
#import "ASIHTTPRequest.h"

@implementation ListViewController
@synthesize dismissButton,progress, resourceList, fileType, productType,logo,resourceType,downloadButton,metrics;
@synthesize date1,date2;


-(IBAction) dismiss{
    [self dismissModalViewControllerAnimated:YES];

}

- (void) addDeleteButton:(NSString *)fileName positionY:(int)yPos_{
    UIButton *delete = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *boton = [UIImage imageNamed:@"botonDel.png"];
    [delete addTarget:self action:@selector(deleteFile:) forControlEvents:UIControlEventTouchUpInside];
    [delete setTitle:fileName forState:UIControlStateNormal];
    [delete setImage:boton forState:UIControlStateNormal];
    delete.frame = CGRectMake(800, yPos_, 50, 50);
    [self.view addSubview:delete];
}

-(IBAction)downloadContent{
    NSArray *dirPaths;
    NSString *downDir;
    progress.alpha=1.0;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                                   NSUserDomainMask, YES);
    
    downDir = [dirPaths objectAtIndex:0];
    //downDir = [[NSBundle mainBundle]bundlePath];
    NSURL *url;
    NSString *link;
    ASIHTTPRequest *request;

    switch (self.resourceType) {
        case 1:
            link = @"http://dl.dropbox.com/u/38853425/visualAid.pdf";
            break;
        case 2:
            link = @"http://dl.dropbox.com/u/38853425/extraMaterial.pdf";
            break;            
        case 3:
            link = @"http://dl.dropbox.com/u/38853425/videos.m4v";            
            break;            
        default:
            break;
    }
    url = [NSURL URLWithString:link];
    //                        NSLog([url lastPathComponent]);
    
    request = [ASIHTTPRequest requestWithURL:url];
    [request setDownloadDestinationPath:[downDir stringByAppendingPathComponent:[url lastPathComponent]]];
    [request showAccurateProgress];
    [request setDownloadProgressDelegate:progress];
    //[request setDownloadProgressDelegate:self];

    [request setDelegate:self];
    
          
    [request startAsynchronous];
    date1 = [NSDate date];     
    
    [date1 retain];


}




- (void)requestFinished:(ASIHTTPRequest *)request
{
    date2 = [NSDate date];

    NSArray *dirPaths;
    NSString *downDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                                   NSUserDomainMask, YES);
    
    downDir = [dirPaths objectAtIndex:0];
    //NSString *downDir = [[NSBundle mainBundle]bundlePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[downDir stringByAppendingPathComponent:[[request url] lastPathComponent]]])
    {

        for(UIView *view in self.view.subviews){
            if ([view isKindOfClass:[ResourceView class]]) {
                if([[(ResourceView *) view fileName] isEqualToString:[[[request url] lastPathComponent]stringByDeletingPathExtension]]){
                    view.alpha=1.0;
                    [self addDeleteButton:[[request url] lastPathComponent] positionY:view.frame.origin.y];
                }
            }
        }
        self.downloadButton.enabled=NO;
        progress.alpha=0.0;
    }   
    NSMutableString *cad = [[NSMutableString alloc] init ];
    NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
    [format setNumberStyle:NSNumberFormatterDecimalStyle];
    [format setGroupingSeparator:@","];
    NSNumber *num = [NSNumber numberWithUnsignedLongLong:request.totalBytesRead];
    [cad appendString: [NSString stringWithFormat:@"Tamaño descarga:%@ bytes", [format stringForObjectValue:num ]]];
    //NSString *c = [date1 description];
        
    NSTimeInterval distanceBetweenDates = [date2 timeIntervalSinceDate:date1];
    
    NSNumber *num2 = [NSNumber numberWithUnsignedLongLong:[ASIHTTPRequest averageBandwidthUsedPerSecond]];
    [cad appendFormat:@"\nTiempo(*): %f secs",distanceBetweenDates];
    [cad appendFormat:@"\nAncho de Banda: %@ bytes/sec", [format stringForObjectValue:num2 ]];

    metrics.text = cad;
    [date1 release];
    [cad release];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
//        self.resourceList = [NSMutableDictionary dictionary];
//        [self.resourceList setObject:@"TicagrelorMecanismodeAccion" 
//                              forKey:@"Ticagrelor Mecanismo de Acción"];
//        [self.resourceList setObject:@"VideoCorazon" forKey:@"Video Corazón"];
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
//    int yPos = 200;
//    for (NSString* key in [resourceList allKeys]) {
//        ResourceView *resourceView = [[ResourceView alloc] initWithFrame:CGRectMake(300, yPos, 500, 50) 
//                                                      withLocalResponder:self 
//                                                               withTitle:key 
//                                                             andFileName:[resourceList objectForKey:key]];
//        [self.view addSubview:resourceView];
//        yPos += 60;
//    }
    
}



- (void) pushResourceViewControllerWithFile:(NSString*)file
{
    NSArray *dirPaths;
    NSString *downDir;
    NSString *root;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    downDir = [dirPaths objectAtIndex:0];
    root = [[NSBundle mainBundle]bundlePath];

    NSString *filename = [file stringByAppendingPathExtension:fileType];

    NSURL *url;
    if ([[NSFileManager defaultManager] fileExistsAtPath:[downDir stringByAppendingPathComponent:filename]])
        url = [NSURL fileURLWithPath:[downDir stringByAppendingPathComponent:filename]];
    else
        url = [NSURL fileURLWithPath:[root stringByAppendingPathComponent:filename]];


    
        
    if (fileType == pdf) {
        QLPreviewController *controlador1 = [[QLPreviewController alloc] init];
        HelperViewController *dummy = [[HelperViewController alloc] init];

        dummy.documents=[url path];
        controlador1.dataSource =dummy;
        controlador1.delegate=dummy;
        controlador1.currentPreviewItemIndex =0;

        [self presentModalViewController:controlador1 animated:YES];
          
        [controlador1 release]; 
    } else {
        MPMoviePlayerViewController *movController = [[MPMoviePlayerViewController alloc] 
                                                      initWithContentURL:url];
        [self presentMoviePlayerViewControllerAnimated:movController];
    }
}



- (void) setResourceIconForButtonTag:(int)tag
{
    ResourceManager *manager = [[ResourceManager alloc]init];
    
    NSString *resource = Nil;
    fileType = pdf;
    
    if (tag == 1) {
        resource = @"botonAyudaVisual.png";

        self.resourceList = [[NSMutableDictionary alloc ] initWithDictionary:[manager visualAidsByProduct:self.productType]];

        
    } else if(tag == 2) {
        resource = @"botonMaterialesExtra.png";
        self.resourceList = [[NSMutableDictionary alloc ] initWithDictionary:[manager extrasByProduct:self.productType]];

        
    } else if(tag == 3) {

        
        self.resourceList = [[NSMutableDictionary alloc ] initWithDictionary:[manager videosByProduct:self.productType]];
        resource = @"botonVideos.png";
                fileType = video;


    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:resource]];
    [imageView setFrame:CGRectMake(33, 203, imageView.frame.size.width, imageView.frame.size.height)];
    [self.view addSubview:imageView];
    
    int yPos = 200;

    for (NSString* key in [resourceList allKeys]) {
        BOOL content=NO;
        
        if ([key hasPrefix:@"Prueba"]) {
            content = YES;
        }        
        ResourceView *resourceView = [[ResourceView alloc] initWithFrame:CGRectMake(300, yPos, 500, 50) 
                                                      withLocalResponder:self 
                                                               withTitle:key 
                                                                fileName:[resourceList objectForKey:key]
                                                    andDownloadedContent:content];
        if ([key hasPrefix:@"Prueba"]) {
        


        NSArray *dirPaths;
        NSString *downDir;
        dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        downDir = [dirPaths objectAtIndex:0];
        //downDir = [[NSBundle mainBundle]bundlePath];    
        NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:downDir error:NULL];
            if([directoryContent count]>0){
                for (NSString *file in directoryContent){
                    if([[resourceList objectForKey:key] isEqualToString:[file stringByDeletingPathExtension]]){
                        resourceView.alpha = 1.0;
                        self.downloadButton.enabled=NO;
                        
                        [self addDeleteButton:file positionY:yPos];

                        break;
                    }else{
                        resourceView.alpha = 0.0;
                        self.downloadButton.enabled=YES;
                    }
                }
            }else{
                resourceView.alpha = 0.0;
                self.downloadButton.enabled=YES;
            }
        }
                     
        
        [self.view addSubview:resourceView];
        yPos += 60;
    }
    
}



-(void)deleteFile:(UIButton *)sender{
    NSArray *dirPaths;
    NSString *downDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    downDir = [dirPaths objectAtIndex:0];
    NSString *path = [downDir stringByAppendingPathComponent:sender.titleLabel.text];
    NSError *error;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])		//Does file exist?
	{
		if (![[NSFileManager defaultManager] removeItemAtPath:path error:&error])	//Delete it
		{
			NSLog(@"Delete file error: %@", error);
		}else{

            for(UIView *view in self.view.subviews){
                if ([view isKindOfClass:[ResourceView class]]) {

                    if([[(ResourceView *) view fileName] isEqualToString:[sender.titleLabel.text stringByDeletingPathExtension]]){

                        view.alpha=0.0;
                        
                    }
                }
            }
            self.downloadButton.enabled=YES;
            progress.alpha=0.0;
            metrics.text=nil;
            
            [sender removeFromSuperview];
            
        }
	}
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
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
