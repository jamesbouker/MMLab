//
//  MasterViewController.m
//  MMLab
//
//  Created by Jimmy on 4/2/14.
//  Copyright (c) 2014 JimmyBouker. All rights reserved.
//

#import "RootViewController.h"

#import "ProjectViewController.h"

@interface RootViewController () {
    // Array of dictionaries
    NSMutableArray *_objects;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMetadata];
}

-(void)loadMetadata {
    // create the objects array
    _objects = [[NSMutableArray alloc] init];
    
    // load the Metadata.plist from the Resources folder
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Metadata" ofType:@"plist"];
    NSDictionary *plist = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    // extract out the name and year
    for(NSString *name in plist) {
        NSString *year = plist[name];
        NSDictionary *dictionary = @{@"name" : name, @"year" : year};
        
        // add to the objects array
        [_objects addObject:dictionary];
    }
    
    // sort the objects array by year
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"year" ascending:NO];
    _objects = [[NSMutableArray alloc] initWithArray:[_objects sortedArrayUsingDescriptors:@[sortDescriptor]]];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // grab the reusable cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    // get the object for this index path
    NSDictionary *object = _objects[indexPath.row];
    
    // set the text and detail lables to name and date
    cell.textLabel.text = object[@"name"];
    cell.detailTextLabel.text = object[@"year"];
    
    return cell;
}

// called when user presses a cell - setup in the Storyboard
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        // grab the index path and object selected
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = _objects[indexPath.row];
        
        // grab the destination view controller
        ProjectViewController *projectViewController = segue.destinationViewController;
        
        //set it's currentItem to the rendered on the selected cell
        projectViewController.currentItem = object[@"name"];
    }
}

@end
