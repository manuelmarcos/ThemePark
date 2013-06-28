//
//  AppDelegate.h
//  ThemePark
//
//  Created by Manuel Marcos Regalado on 22/06/13.
//  Copyright (c) 2013 Manuel Marcos Regalado. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PhotoGrabber.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, PhotoGrabberDelegate>{
    PhotoGrabber *grabber;
}
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *view;

@property (nonatomic,retain) PhotoGrabber *grabber;
- (IBAction)takeSnapShoot:(id)pId;

@end
