//
//  ForceDirectedGraph.h
//  croma
//
//  Created by Template on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBNode.h"
#import <CoreImage/CIImage.h>

@interface ForceDirectedGraph : NSObject
{
    NSMutableDictionary * nodes;
    FBNode *me;
    float spring;
    float damping;
@public BOOL displayNeeded;
}
-(ForceDirectedGraph *) init;
-(void) addNode:(float) i_x y:(float) i_y mass:(float) i_mass name:(NSString*) n i_id:(NSString *) fid desc:(NSString *) d;
-(void) logNodes;
-(void) applyForceToNodes;
-(NSMutableDictionary *) getNodes;
@property (nonatomic, retain) NSMutableDictionary * nodes;
@property (nonatomic,retain) FBNode  * me;

@end
