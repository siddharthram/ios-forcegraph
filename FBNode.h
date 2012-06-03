//
//  FBNode.h
//  croma
//
//  Created by Template on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreImage/CIImage.h>

@interface FBNode : NSObject {
  @public  float x;
  @public  float y;
  @public  float mass;
  @public  float dx;
  @public  float dy;
@public NSString * name;
@public NSString *desc;
@public NSString * fid;
@public CIImage*  image;
@public BOOL imageDrawn;
@public BOOL displayed;
@public UIImage * uiImage;
    
}

@end
