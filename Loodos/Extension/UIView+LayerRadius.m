//
//  UIView+LayerRadius.m
//  Loodos
//
//  Created by macbookair on 27.09.2018.
//  Copyright © 2018 Erim Kurt. All rights reserved.
//

#import "UIView+LayerRadius.h"

@implementation UIView (LayerRadius)

-(void)layerViewRadius:(float)radius{
    CALayer *contentlayer = self.layer;
    contentlayer.masksToBounds = YES;
    contentlayer.cornerRadius = radius;
}

@end
