//
//  NSLayoutConstraint+Reset.m
//  Carspotter
//
//  Created by Razvan Bangu on 2016-02-21.
//  Copyright © 2016 Razio. All rights reserved.
//

#import "NSLayoutConstraint+Reset.h"

@implementation NSLayoutConstraint (Reset)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL original = @selector(setConstant:);
        SEL swizzled = @selector(carspotter_setConstant:);
        
        Method originalMethod = class_getInstanceMethod(class, original);
        Method swizzledMethod = class_getInstanceMethod(class, swizzled);
        
        BOOL didAddMethod = class_addMethod(class, original, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if(didAddMethod) {
            class_replaceMethod(class, swizzled, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
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

- (void)carspotter_setConstant:(CGFloat)constant {
    if(![self initialConstant]) {
        self.initialConstant = [NSNumber numberWithFloat:constant];
    }
    
    [self carspotter_setConstant:constant];
}

@end
