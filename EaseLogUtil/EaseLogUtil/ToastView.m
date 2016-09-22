//
//  ToastView.m
//  EaseLogUtil
//
//  Created by 杜洁鹏 on 9/22/16.
//  Copyright © 2016 杜洁鹏. All rights reserved.
//

#import "ToastView.h"

#define D_GrayColor3 [NSColor colorWithSRGBRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1] 

@implementation ToastView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [D_GrayColor3 setFill];
    NSRectFill(dirtyRect);
}


@end
