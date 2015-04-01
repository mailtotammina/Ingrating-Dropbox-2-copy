//
//  ViewController.m
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved
//

#import "ViewController.h"
#import <DBChooser/DBChooser.h>
#import <DropboxSDK/DropboxSDK.h>
#import "DropboxManager.h"
#import "ImagesCollectionViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) DropboxManager *dropboxMngr;
@property (nonatomic,strong) NSMutableArray *images;

@end

@implementation ViewController

-(NSMutableArray *)images
{
    if(!_images)
    {
        _images=[[NSMutableArray alloc]init];
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dropboxMngr=[[DropboxManager alloc] init];
    [self.dropboxMngr downloadFilesFromDropbox];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressChooser:(UIButton *)sender
{

    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
        self.buttonPrt.enabled=YES;
    }
    
}

- (IBAction)logout:(id)sender
{
    //[[DBSession sharedSession] unlinkAll];
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)uploadedPhotos:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"ImagesSegue" sender:sender];
}

- (IBAction)soundRecorder:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ImagesSegue"])
    {
        ImagesCollectionViewController *imagesCVC=(ImagesCollectionViewController *)segue.destinationViewController;
        imagesCVC.images=self.images;
        
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.images addObject:image];
    
    [self.dropboxMngr uploadAFileToDropbox:image];
    
    // You have the image. You can use this to present the image in the next view like you require in `#3`.
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
