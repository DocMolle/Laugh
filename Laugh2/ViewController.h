//
//  ViewController.h
//  Laugh2
//
//  Created by Sven-Eric on 2/24/15.
//  Copyright (c) 2015 Molzahn Consulting. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <RedditKit/RedditKit.h>

@interface ViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource> {
    NSArray *items;
}
@property (nonatomic, strong) NSArray *items;
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSImageView *imgView;


@end

