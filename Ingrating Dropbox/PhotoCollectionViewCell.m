//
//  PhotoCollectionViewCell.m
//  Thousand Words
//
//  Created by Manoj Tammina on 3/31/15.
//  Copyright (c) 2015 tammia. All rights reserved//

#import "PhotoCollectionViewCell.h"

#define IMAGEVIEW_BORDER_LENGTH 5

@implementation PhotoCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self setUp];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if(self)
    {
        [self setUp];
    }
    return self;
}

-(void)setUp
{
    self.imageView=[[UIImageView alloc]initWithFrame:CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH)];
    [self.contentView addSubview:self.imageView];

}
@end
