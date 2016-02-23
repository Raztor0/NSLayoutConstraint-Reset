//
//  NSLayoutConstraint+Reset.m
//
//  Created by Razvan Bangu on 2016-02-21.
//  Copyright © 2016 Razio. All rights reserved.
//

#import "NSLayoutConstraint+Reset.h"
#import "JRSwizzle.h"
#import <objc/runtime.h>

@implementation NSLayoutConstraint (Reset)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self jr_swizzleMethod:@selector(setConstant:) withMethod:@selector(razvan_setConstant:) error:nil];
    });
}

#pragma mark - Public

- (CGFloat)originalConstant {
    return [[self initialConstant] floatValue];
}

- (void)reset {
    self.constant = [self.initialConstant floatValue];
}

#pragma mark - Private

- (NSNumber *)initialConstant {
    return objc_getAssociatedObject(self, @selector(initialConstant));
}

- (void)setInitialConstant:(NSNumber *)initialConstant {
    objc_setAssociatedObject(self, @selector(initialConstant), initialConstant, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)razvan_setConstant:(CGFloat)constant {
    if(![self initialConstant]) {
        self.initialConstant = [NSNumber numberWithFloat:constant];
    }
    
    [self razvan_setConstant:constant];
}

@end
