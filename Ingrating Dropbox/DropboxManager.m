//
//  DropboxManager.m
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved
//

#import "DropboxManager.h"
#import <DropboxSDK/DropboxSDK.h>

@interface DropboxManager ()<DBRestClientDelegate>

@property (nonatomic, strong) DBRestClient *restClient;
@property (nonatomic,strong) NSString *localDir;

@end

@implementation DropboxManager

-(void)uploadAFileToDropbox:(UIImage *)image
{
    self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
    //NSLog(@"%@",[DBSession sharedSession].userIds);
    self.restClient.delegate = self;
    
  
    
    //Upload a Image
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingString:@"test.png"];
    
    NSData * data = [NSData dataWithData:UIImagePNGRepresentation(image)];
    [data writeToFile:path atomically:YES];
    [self.restClient uploadFile:@"test.png" toPath:@"/TestImages" withParentRev:nil fromPath:path];
    

    
}

-(id)init
{
    self=[super init];
    if(self)
    {
        self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
        self.restClient.delegate = self;
        self.localDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    }
    return self;
}

-(void)downloadFilesFromDropbox
{
    
    //Listing the folders
    [self.restClient loadMetadata:@"/TestImages"];
    
    //TO download a file to local path
    [self.restClient loadFile:@"/TestImages" intoPath:self.localDir];
    
   
    
}

- (void)restClient:(DBRestClient *)client uploadedFile:(NSString *)destPath
              from:(NSString *)srcPath metadata:(DBMetadata *)metadata {
    NSLog(@"File uploaded successfully to path: %@", metadata.path);
}

- (void)restClient:(DBRestClient *)client uploadFileFailedWithError:(NSError *)error {
    NSLog(@"File upload failed with error: %@", error);
}

- (void)restClient:(DBRestClient *)client loadedMetadata:(DBMetadata *)metadata {
    NSMutableArray *picsLoaded = [NSMutableArray arrayWithObjects:@"", nil];
    if (metadata.isDirectory) {
        NSLog(@"Folder '%@' contains:", metadata.path);
        for (DBMetadata *file in metadata.contents) {
            [picsLoaded addObject:file];

            NSLog(@"	%@", file.filename);
        }
    }
}

- (void)restClient:(DBRestClient *)client
loadMetadataFailedWithError:(NSError *)error {
    NSLog(@"Error loading metadata: %@", error);
}

- (void)restClient:(DBRestClient *)client loadedFile:(NSString *)localPath
       contentType:(NSString *)contentType metadata:(DBMetadata *)metadata {
    NSLog(@"File loaded into path: %@", localPath);
}

- (void)restClient:(DBRestClient *)client loadFileFailedWithError:(NSError *)error {
    NSLog(@"There was an error loading the file: %@", error);
}


@end
