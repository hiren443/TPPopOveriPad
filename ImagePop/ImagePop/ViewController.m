//
//  ViewController.m
//  ImagePop
//
//  Created by digicorp on 07/02/13.
//  Copyright (c) 2013 digicorp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) showCameraUI {
    BOOL hasCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = hasCamera ? UIImagePickerControllerSourceTypeCamera :    UIImagePickerControllerSourceTypePhotoLibrary;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:picker];
    CGRect popoverRect = [self.view convertRect:[yourBtn frame]
                                       fromView:[yourBtn superview]];
    
    popoverRect.size.width = MIN(popoverRect.size.width, 100) ;
    popoverRect.origin.x = popoverRect.origin.x;
    
    [popoverController
     presentPopoverFromRect:popoverRect
     inView:self.view
     permittedArrowDirections:UIPopoverArrowDirectionAny
     animated:YES];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissModalViewControllerAnimated:YES];
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
     img.image= image;
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
        popoverController=nil;
    }

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
    [picker dismissModalViewControllerAnimated:YES];
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
        popoverController=nil;
    }

}

- (void)pickerDone:(id)sender
{
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
        popoverController=nil;
    }
}
@end
