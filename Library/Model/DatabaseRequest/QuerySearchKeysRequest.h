//
//  QuerySearchKeysRequest.h
//  MVVM
//
//  Created by shuilin on 07/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "XSCoreDataRequest.h"

@interface QuerySearchKeysRequest : XSCoreDataRequest

@property (readonly, strong, nonatomic) NSArray *keys;

@end
