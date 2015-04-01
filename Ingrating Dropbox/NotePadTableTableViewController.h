//
//  NotePadTableTableViewController.h
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved
//

#import <UIKit/UIKit.h>
#import "NewNote.h"
#import "NoteDetailView.h"

@interface NotePadTableTableViewController : UITableViewController<NewNoteDelegate>

- (IBAction)newNote:(UIBarButtonItem *)sender;

@end
