//
//  ViewController.m
//  Laugh2
//
//  Created by Sven-Eric on 2/24/15.
//  Copyright (c) 2015 Molzahn Consulting. All rights reserved.
//

#import "ViewController.h"
#import "ItemCellView.h"


@implementation ViewController

@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[RKClient sharedClient] subredditWithName:@"funny" completion:^(RKSubreddit *subreddit, NSError *error) {
        NSLog(@"URL: %@",[subreddit URL]);
        
        [[RKClient sharedClient] linksInSubreddit:subreddit category:RKSubredditCategoryHot pagination:nil completion:^(NSArray *links, RKPagination *pagination, NSError *error) {
            NSLog(@"Links: %@", links);
            items = links;
            [self.tableView reloadData];
        }];
    }];
    
    
    

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 64;
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return [items count];
}


-(void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger selected = [self.tableView selectedRow];
    RKLink *selectedLink = items[selected];
   
        NSURL *imageURL = [selectedLink URL];
        NSImage *imageFromBundle = [[NSImage alloc] initWithContentsOfURL:imageURL];
        self.imgView.imageScaling = NSImageScaleProportionallyUpOrDown;
        self.imgView.animates = YES;
        [self.imgView setImage:imageFromBundle];
    
    //Copy link to clipboard
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:[imageURL absoluteString]  forType:NSStringPboardType];
   
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSString *identifier = [tableColumn identifier];
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"dd.MM.yyyy | hh.mm"];
    
    
    if ([identifier isEqualToString:@"MainCell"]){
        ItemCellView *cellView = [tableView makeViewWithIdentifier:@"MainCell" owner:self];
        
        NSString *title = [items[row] title];
        NSString *author = [items[row] author];
        NSString * submitted = [@"Submitted by " stringByAppendingString:author];
        
        [cellView.textField setStringValue:title];
        [cellView.authorField setStringValue:submitted];
        return cellView;
    }
    return nil;
}

@end
