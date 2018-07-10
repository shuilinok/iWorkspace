//
//  AddSearchKeyRequest.h
//  MVVM
//
//  Created by shuilin on 06/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FGCoreDataRequest.h"

@interface AddSearchKeyRequest : FGCoreDataRequest

@property (strong, nonatomic) NSString *key;

@end
