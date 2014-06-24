//
//  ViewController.h
//  ImagePop
//
//  Created by digicorp on 07/02/13.
//  Copyright (c) 2013 digicorp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPopoverControllerDelegate, UIImagePickerControllerDelegate>
{
    UIPopoverController *popoverController;
    IBOutlet UIButton *yourBtn;
    IBOutlet UIImageView *img;
}

- (IBAction) showCameraUI;
@end
