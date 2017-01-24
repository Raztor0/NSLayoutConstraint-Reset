//
//  NSLayoutConstraint+Reset.m
//
//  Created by Razvan Bangu on 2016-02-21.
//  Copyright © 2016 Razio. All rights reserved.
//

#import "NSLayoutConstraint+Reset.h"
#import <objc/runtime.h>

@implementation NSLayoutConstraint (Reset)

#pragma mark - Public

- (CGFloat)originalConstant {
    return [[self initialConstant] floatValue];
}

- (void)initializeConstraint {
    self.initialConstant = @(self.constant);
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

@end
