//
//  ResourceManager.h
//  VisualAid
//
//  Created by David Rodriguez on 12/11/11.
//  Copyright (c) 2011 UNAM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResourceManager : NSObject
{
    NSMutableDictionary *products;
    NSMutableArray *resources;
    
    NSMutableArray *aids;
    NSMutableArray *aidsK;
    NSMutableArray *extras;
    NSMutableArray *extrasK;
    NSMutableArray *videos;
    NSMutableArray *videosK;;        
    NSDictionary *aidsD;
    NSDictionary *extrasD;
    NSDictionary *videosD;
    
    BOOL downloadedAids;
    BOOL downloadedExtras;
    BOOL downloadedVideos;

}
@property (nonatomic) BOOL downloadedAids;
@property (nonatomic) BOOL downloadedExtras;
@property (nonatomic) BOOL downloadedVideos;

@property (retain,nonatomic) NSMutableDictionary *products;
@property (retain,nonatomic) NSMutableArray *resources;


- (id) init;

- (BOOL) productHasVisualAids:(int)product;
- (BOOL) productHasExtras:(int)product;
- (BOOL) productHasVideos:(int)product;

- (NSString *) nameOfProduct:(int)indexOfProduct;
- (NSDictionary *) visualAidsByProduct:(int)indexOfProduct;
- (NSDictionary *) extrasByProduct:(int)indexOfProduct;
- (NSDictionary *) videosByProduct:(int)indexOfProduct;

@end
