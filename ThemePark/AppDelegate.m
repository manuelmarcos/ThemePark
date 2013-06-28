//
//  AppDelegate.m
//  ThemePark
//
//  Created by Manuel Marcos Regalado on 22/06/13.
//  Copyright (c) 2013 Manuel Marcos Regalado. All rights reserved.
//

#import "AppDelegate.h"
#import "QRCodeGenerator.h"

@implementation AppDelegate
@synthesize grabber;
@synthesize view;

- (void)dealloc
{
    [grabber release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    grabber = [[PhotoGrabber alloc] init];
	grabber.delegate = self;
    

    
}

- (void)photoGrabbed:(NSImage*)image
{
    
    
    
    //generate UIImageViews
    //NSImageView *imageView=[self generateNewView];
    
    
    
	// image is the image from the camera. We set it up in the imageview
    NSImageView *imageView=[[NSImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [imageView setImage:image];

    [self.view addSubview:imageView];
    [imageView release];
    
    //we get the date of the taken picturen. It will be unique
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddhhmmss"];
    
    //encode the string into the QRCode. The string will be unique date
    NSImageView *imageViewQR=[[NSImageView alloc] initWithFrame:CGRectMake(17, 548, 50, 50)];
    imageViewQR.image = [QRCodeGenerator qrImageForString:[dateFormatter stringFromDate:[NSDate date]] imageSize:imageView.bounds.size.width];
    [self.view addSubview:imageViewQR];
    [imageViewQR release];

    //Obtain the png of the QRCode
    NSBitmapImageRep *imgRep = [[image representations] objectAtIndex: 0];
    NSData *data = [imgRep representationUsingType: NSPNGFileType properties: nil];
    
    //We store the Image in the server (The server does not have an API yet)
    [data writeToFile:[NSString stringWithFormat:@"/Applications/MAMP/htdocs/theme_park/%@.png",[dateFormatter stringFromDate:[NSDate date]]] atomically: NO];
    
    [dateFormatter release];
    
}


-(NSImageView *)generateNewView{



}



- (IBAction)takeSnapShoot:(id)pId
{
    [grabber grabPhoto];
}


@end
