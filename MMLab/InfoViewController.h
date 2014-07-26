//
//  InfoViewController.h
//  MMLab
//
//  Created by Jimmy on 4/2/14.
//  Copyright (c) 2014 JimmyBouker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface InfoViewController : UIViewController {
    
}

@property (strong, nonatomic) IBOutlet UITextView *projText;
@property (strong, nonatomic) NSString *currentItem;

- (IBAction)playMovie:(id)sender;

@end
