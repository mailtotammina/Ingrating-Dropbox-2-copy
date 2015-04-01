//
//  ImagesCollectionViewController.m
//  Ingrating Dropbox
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved
//

#import "ImagesCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoDetailViewController.h"

@interface ImagesCollectionViewController ()

@end

@implementation ImagesCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete method implementation -- Return the number of items in the section
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor whiteColor];
    UIImage *image=[self.images objectAtIndex:indexPath.row];
    cell.imageView.image=image;
    // Configure the cell
    
    return cell;
}

//Segue method
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[PhotoDetailViewController class]])
    {
        PhotoDetailViewController *photoDetailVC=segue.destinationViewController;
        //NSIndexPath *indexPath=[[self.collectionView indexPathsForSelectedItems] lastObject];
        NSIndexPath *indexPath=sender;
        UIImage *image=self.images[indexPath.row];
        photoDetailVC.photo=image;
    }

}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DetailSegue" sender:indexPath];
}

@end
