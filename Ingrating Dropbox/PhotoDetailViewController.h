//
//  PhotoDetailViewController.h
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface PhotoDetailViewController : UIViewController

@property (nonatomic,strong) UIImage *photo;

@property(strong,nonatomic) SLComposeViewController *slComposeViewController;
@property(strong,nonatomic) NSData *imageToShare;
- (IBAction)fbShare:(id)sender;
@end
