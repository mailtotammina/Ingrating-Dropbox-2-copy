//
//  audioRec.h
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioRecorderViewController : UIViewController<AVAudioRecorderDelegate, AVAudioPlayerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *playBtn;
@property (strong, nonatomic) IBOutlet UIButton *stopBtn;
@property (strong, nonatomic) IBOutlet UIButton *recordBtn;

- (IBAction)recTap:(id)sender;
- (IBAction)stopTap:(id)sender;

- (IBAction)playTap:(id)sender;
@end
