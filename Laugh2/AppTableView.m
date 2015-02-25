//
//  AppTableView.m
//  Laugh
//
//  Created by Sven-Eric on 2/24/15.
//  Copyright (c) 2015 Molzahn Consulting. All rights reserved.
//

#import "AppTableView.h"

@implementation AppTableView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleSourceList];
    // Drawing code here.
}

- (NSTableHeaderView *)headerView{
    return nil;
}

@end
