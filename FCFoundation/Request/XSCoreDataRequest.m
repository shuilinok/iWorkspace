//
//  XSCoreDataRequest.m
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSCoreDataRequest.h"
#import "XSCoreDataRequestManager.h"

@interface XSCoreDataRequest ()
@property (copy, nonatomic) XSResultCallback callback;
@end

@implementation XSCoreDataRequest

- (void)send:(XSResultCallback)callback
{
    self.callback = callback;
    
    if(self.manager == nil)
    {
        abort();
    }
    
    [self.manager addRequest:self];
}

- (void)execute:(NSManagedObjectContext *)moc callback:(XSResultCallback)callback
{
    //子类实现
    abort();
}

- (NSError *)save:(NSManagedObjectContext *)moc
{
    NSError *error;
    
    BOOL isSaveSuccess = [moc save:&error];
    if (!isSaveSuccess)
    {
        NSLog(@"Error Save: %@,%@",error,[error userInfo]);
    }
    else
    {
        //NSLog(@"Save successful!");
    }
    
    return error;
}

- (NSArray *)executeFetchRequest:(NSFetchRequest *)request error:(NSError **)error moc:(NSManagedObjectContext *)moc
{
    @try {
        NSArray *fetchedObjects = [moc executeFetchRequest:request error:error];
        return fetchedObjects;
    }
    @catch (NSException *exception) {
        
        NSLog(@"查询异常:%@",exception);
    }
    @finally {
        
    }
    
    return nil;
}

@end
