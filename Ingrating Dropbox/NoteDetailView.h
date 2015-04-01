//
//  NoteDetailView.h
//  Ingrating Dropbox
//
//  Created by Manoj Ram on 4/1/15.
//  Copyright (c) 2015 nwmissouri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteDetailView : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *noteText;
@property (nonatomic,strong) NSString *noteString;
@end
