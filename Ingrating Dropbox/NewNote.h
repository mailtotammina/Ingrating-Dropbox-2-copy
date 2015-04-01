//
//  NewNote.h
//  Ingrating Dropbox
//
//  Created by Manoj Ram on 4/1/15.
//  Copyright (c) 2015 nwmissouri. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NewNoteDelegate<NSObject>
@required


-(void)add:(NSString *)note;

@end

@interface NewNote : UIViewController<UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UITextView *textViewObject;
@property (weak,nonatomic) id<NewNoteDelegate> del;

- (IBAction)addButton:(id)sender;

@end


