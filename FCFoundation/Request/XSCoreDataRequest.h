//
//  XSCoreDataRequest.h
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSCallback.h"
#import <CoreData/CoreData.h>


@class XSCoreDataRequestManager;

@interface XSCoreDataRequest : NSObject

@property (assign, nonatomic) NSUInteger level;//优先级，默认0，值越大越优先

@property (weak, nonatomic) XSCoreDataRequestManager *manager;

- (void)send:(XSResultCallback)callback;

@end


@interface XSCoreDataRequest (ManagerAccess)

@property (readonly, copy, nonatomic) XSResultCallback callback;

- (NSError *)save:(NSManagedObjectContext *)moc;

- (NSArray *)executeFetchRequest:(NSFetchRequest *)request error:(NSError **)error moc:(NSManagedObjectContext *)moc;

//子类重写
- (void)execute:(NSManagedObjectContext *)moc callback:(XSResultCallback)callback;

@end
