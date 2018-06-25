//
//  QuerySearchKeysRequest.h
//  MVVM
//
//  Created by shuilin on 07/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "FGCoreDataRequest.h"

@interface QuerySearchKeysRequest : FGCoreDataRequest

@property (readonly, strong, nonatomic) NSArray *keys;

@end
