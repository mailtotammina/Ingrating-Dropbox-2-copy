//
//  ViewController.h
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *buttonPrt;

- (IBAction)didPressChooser:(UIButton *)sender;

- (IBAction)logout:(id)sender;

- (IBAction)uploadedPhotos:(UIButton *)sender;

- (IBAction)soundRecorder:(id)sender;

@end

