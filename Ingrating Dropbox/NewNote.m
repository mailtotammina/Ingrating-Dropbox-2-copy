//
//  NewNote.m
//  Ingrating Dropbox
//
//  Created by Manoj Ram on 4/1/15.
//  Copyright (c) 2015 nwmissouri. All rights reserved.
//

#import "NewNote.h"

@interface NewNote ()

@end

@implementation NewNote

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      self.textViewObject.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//to dismiss keyboard
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textViewObject endEditing:YES];
}


- (IBAction)addButton:(id)sender {
    
    [self.del add:self.textViewObject.text];
    
}

@end
