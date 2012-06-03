//
//  ForceDirectedGraph.m
//  croma
//
//  Created by Template on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ForceDirectedGraph.h"

@implementation ForceDirectedGraph 
@synthesize nodes;
@synthesize me;

-(ForceDirectedGraph *) init
{
    displayNeeded = YES;
    spring = 2.0;
    damping = 0.4;
    me = [FBNode alloc] ;
    nodes = [[NSMutableDictionary alloc] init];
    me->x = 0.0;
    me->y = 0.;
    me->mass = 3.0;
    me->imageDrawn = NO;
    me->displayed = NO;
    return self;
}

-(void) addNode: (float) i_x y:(float) i_y mass:(float) i_mass name:(NSString*) name i_id:(NSString *) fid desc:(NSString *) desc {
    FBNode * node = [FBNode alloc];
    // ignore ix and iy for now: set the initial position randomly
    //node->x = i_x;
    //node->y = i_y;
    //assume drawing space is 100x100
    node->x = arc4random() %600;
    node->y = arc4random() %800;
    
    node->mass = i_mass;
    node->name = name;
    node->desc = desc;
    node->fid = fid;
    node->imageDrawn = NO;
    node->displayed = NO;
    
    
    [nodes setObject:node forKey:fid];
}

-(void) applyForceToNodes
{
    for (NSString *key in nodes)
    {             
        FBNode *node = [nodes objectForKey:key]; 
        double dx = node->x - me->x;
        double dy =  node->y - me->y;
        double hypotenuse = sqrt(pow(dx,2) + pow(dy,2));
        double force = 0;
        
        force = (hypotenuse -spring)/2.0;
        
        dx /= hypotenuse;
        dy /= hypotenuse;
        dx *= force;
        dy *= force;
        node->dx += dx;
        node->dy += dy;
        node->dx *= damping;
        node->dy *= damping;
        
        //NSLog (@"node - %@, dx = %f, dy=%f", node->name,node->dx, node->dy);
        
    }
}

-(NSMutableDictionary *) getNodes
{
    return nodes;
}

-(void) logNodes
{
   // NSEnumerator *e = nodes.objectEnumerator;
    for (NSString *key in nodes) {
        FBNode *fb = [nodes objectForKey:key];
       NSLog(@"name %@ id %@ x %f y %f", fb->name, fb->fid, fb->x, fb->y);
    }
    
}



@end
