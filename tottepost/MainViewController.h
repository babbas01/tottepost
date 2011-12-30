//
//  MainViewController.h
//  tottepost mainview controller   	
//
//  Created by Ken Watanabe on 11/12/10.
//  Copyright (c) 2011 cocotomo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingTableViewController.h"
#import "Facebook.h"
#import "ProgressTableViewController.h"
#import "ProgressSummaryView.h"
#import "PreviewPhotoView.h"

/*!
 * Main view controller
 */
@interface MainViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate, PhotoSubmitterPhotoDelegate, SettingTableViewControllerDelegate>{
@protected
    __strong SettingTableViewController *settingViewController_;
    __strong ProgressTableViewController *progressTableViewController_;
    __strong UINavigationController *settingNavigationController_;
    __strong UIImagePickerController* imagePicker_;
    __strong UIBarButtonItem* cameraButton_;
    __strong UIBarButtonItem* postButton_;
    __strong UIBarButtonItem* postCancelButton_;
    __strong UIToolbar *toolbar_;
    __strong UIBarButtonItem *flexSpace_;
    __strong UIBarButtonItem *settingButton_;
    __strong UIBarButtonItem *commentButton_;
    __strong UIBarButtonItem *gpsButton_;
    __strong ProgressSummaryView *progressSummaryView_;
    __strong PreviewPhotoView *previewImageView_;
    UIInterfaceOrientation orientation_;
    UIInterfaceOrientation lastOrientation_;
}

- (id) initWithFrame:(CGRect)frame;
- (void) createCameraController;
@end

