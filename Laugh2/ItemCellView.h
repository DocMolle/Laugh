//
//  ItemCellView.h
//  Readr
//
//  Created by Sven-Eric on 12/30/14.
//  Copyright (c) 2014 Molzahn Consulting. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ItemCellView : NSTableCellView

@property (nonatomic, retain) IBOutlet NSTextField *dateTextField;
@property (nonatomic, retain) IBOutlet NSTextField *authorField;
@property (weak) IBOutlet NSImageView *previewImageVIew;


@end
