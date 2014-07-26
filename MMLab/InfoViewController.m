//
//  InfoViewController.m
//  MMLab
//
//  Created by Jimmy on 4/2/14.
//  Copyright (c) 2014 JimmyBouker. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
@property (nonatomic, strong) MPMoviePlayerController *player;
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // load the text from the propper txt file
    NSString *textName = [NSString stringWithFormat:@"text/%@", _currentItem];
    NSString *path = [[NSBundle mainBundle] pathForResource:textName ofType:@"txt"];
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    // set the text and font
    _projText.text = text;
    _projText.font = [UIFont systemFontOfSize:22];
    _projText.textAlignment = NSTextAlignmentJustified;
    
    // try commenting out this line of code and see what happens
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (IBAction)playMovie:(id)sender {
    // the sender is the button!
    UIButton *button = sender;
    
    // get the video path
    NSString *videoName = [NSString stringWithFormat:@"video/%@", _currentItem];
    NSString *path = [[NSBundle mainBundle] pathForResource:videoName ofType:@"m4v"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // load and setup the player
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [[_player view] setFrame:button.frame];
    
    // add the player to the view and remove the button
    [self.view insertSubview:_player.view belowSubview:button];
    [button removeFromSuperview];
    
    // play the video
    [_player play];
}

@end
