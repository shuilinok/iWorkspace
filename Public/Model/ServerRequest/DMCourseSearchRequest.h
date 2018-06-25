//
//  DMCourseSearchRequest.h
//  MVVM
//
//  Created by shuilin on 02/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CourseInfo.h"
#import "FGHttpRequest.h"
#import "DMHostDefine.h"
#import "DMHttpHeader.h"

@interface DMCourseSearchRequest : NSObject

@property (strong, nonatomic) NSString *key;

@property (assign, nonatomic) NSUInteger offset;

@property (assign, nonatomic) NSUInteger limit;

@property (readonly ,strong, nonatomic) NSArray *infos;//元素SearchCourseInfo

- (void)send:(ResultCallback)callback;

@end

