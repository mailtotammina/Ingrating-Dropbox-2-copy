//
//  NoteDetailView.m
//  Ingrating Dropbox
//
//  Created by Manoj Ram on 4/1/15.
//  Copyright (c) 2015 nwmissouri. All rights reserved.
//

#import "NoteDetailView.h"

@interface NoteDetailView ()

@end

@implementation NoteDetailView
@synthesize noteString;
@synthesize noteText;
- (void)viewDidLoad {
    [super viewDidLoad];
    noteText.text = noteString;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
