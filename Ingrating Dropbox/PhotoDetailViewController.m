//
//  PhotoDetailViewController.m
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved
//

#import "PhotoDetailViewController.h"
#import <Social/Social.h>

@interface PhotoDetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoDetailViewController

@synthesize imageToShare;
@synthesize slComposeViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image=self.photo;
    imageToShare = UIImageJPEGRepresentation(self.photo, 1.0);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Facebook Share
- (IBAction)fbShare:(id)sender
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
{
   
    self.slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [self.slComposeViewController addImage:[UIImage imageWithData:imageToShare]];
    [self presentViewController:self.slComposeViewController  animated:YES completion:nil];
}
else{
    UIAlertView *shareAlert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't share a picture right now, make sure you have atleast one facebook account setup on your device" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [shareAlert show];
}
    
#pragma mark - Facebook Share
    
}
@end
