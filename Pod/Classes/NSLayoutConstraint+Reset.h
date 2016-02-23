//
//  NSLayoutConstraint+Reset.h
//
//  Created by Razvan Bangu on 2016-02-21.
//  Copyright © 2016 Razio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Reset)

@property (nonatomic, assign, readonly) CGFloat originalConstant;

- (void)reset;

@end
