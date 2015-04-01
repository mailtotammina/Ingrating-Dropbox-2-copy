//
//  DropboxManager.h
//  Ingrating Dropbox
//
//  Created by Ramakrishna Makkena on 1/31/15.
//  Copyright (c) 2015 nwmissouri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface DropboxManager : NSObject

-(void)downloadFilesFromDropbox;
-(void)uploadAFileToDropbox:(UIImage *)image;

@end
