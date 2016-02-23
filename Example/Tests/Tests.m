//
//  NSLayoutConstraint-ResetTests.m
//  NSLayoutConstraint-ResetTests
//
//  Created by Razvan Bangu on 02/21/2016.
//  Copyright (c) 2016 Razvan Bangu. All rights reserved.
//

#import "NSLayoutConstraint+Reset.h"
#import "TestView.h"

@import XCTest;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testResetInitializedConstraint {
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIView *constrainedView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    [container addSubview:constrainedView];
    
    NSLayoutConstraint *myConstraint = [NSLayoutConstraint constraintWithItem:constrainedView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:container attribute:NSLayoutAttributeTop multiplier:1.0f constant:20.0f];
    
    XCTAssertEqual(myConstraint.constant, 20.0f);
    myConstraint.constant = 35.0f;
    
    XCTAssertEqual(myConstraint.constant, 35.0f);
    [myConstraint reset];
    
    XCTAssertEqual(myConstraint.constant, 20.0f);
}

- (void)testResetVisuallyInitializedConstraint {
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIView *constrainedView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    [container addSubview:constrainedView];
    
    NSLayoutConstraint *myConstraint = [[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[constrainedView]" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"container" : container, @"constrainedView" : constrainedView}] firstObject];
    
    XCTAssertEqual(myConstraint.constant, 20.0f);
    myConstraint.constant = 35.0f;
    
    XCTAssertEqual(myConstraint.constant, 35.0f);
    [myConstraint reset];
    
    XCTAssertEqual(myConstraint.constant, 20.0f);
}

- (void)testResetXibInitializedConstraint {
    TestView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"TestView" owner:nil options:nil] firstObject];
    
    XCTAssertEqual(view.buttonHeightConstraint.constant, 50.0f);
    
    view.buttonHeightConstraint.constant = 0.0f; // Hide a button
    XCTAssertEqual(view.buttonHeightConstraint.constant, 0.0f);
    
    [view.buttonHeightConstraint reset]; // Show the button again
    XCTAssertEqual(view.buttonHeightConstraint.constant, 50.0f);
}

@end

