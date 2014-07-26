//
//  DetailViewController.m
//  MMLab
//
//  Created by Jimmy on 4/2/14.
//  Copyright (c) 2014 JimmyBouker. All rights reserved.
//

#import "ProjectViewController.h"

@implementation ProjectViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // figure out the images name based on the current Item
    NSString *imageName = [NSString stringWithFormat:@"screenshots/%@.jpg", _currentItem];

    // load the image
    UIImage *image = [UIImage imageNamed:imageName];
    
    // set the imageView's image
    [_screenshot setImage:image];
}

// called when a user presses the learn more button - setup in storyboards
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //
    [segue.destinationViewController setCurrentItem:_currentItem];
}

@end
