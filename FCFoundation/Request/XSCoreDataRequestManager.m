//
//  XSCoreDataRequestManager.m
//  XSSPH
//
//  Created by shuilin on 2018/5/2.
//  Copyright © 2018年 Jeanne. All rights reserved.
//

#import "XSCoreDataRequestManager.h"

@interface XSCoreDataRequestManager ()
{
    dispatch_queue_t queue;
}

@property (strong, nonatomic) NSMutableArray *requests;
@property (strong, nonatomic) NSManagedObjectContext *moc;
@property (strong, nonatomic) NSString *dbName;
@property (strong, nonatomic) NSString *dbModelName;

@end

@implementation XSCoreDataRequestManager

- (instancetype)initWithDb:(NSString *)dbName model:(NSString *)modelName
{
    self = [super init];
    if(self)
    {
        queue = dispatch_queue_create("com.91sph.XSCoreDataRequestManager", NULL);
        self.requests = [[NSMutableArray alloc] init];
        self.dbName = dbName;
        self.dbModelName = modelName;
    }
    
    return self;
}

- (void)addRequest:(XSCoreDataRequest *)request
{
    [self.requests insertObject:request atIndex:0];
    if([self.requests count] == 1)//原来是空的
    {
        [self handleNextRequest];
    }
}

- (void)executeRequest:(XSCoreDataRequest *)request
{
    dispatch_async(queue, ^{
        
        [request execute:self.moc callback:^(NSError *error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.requests removeObject:request];
                //处理队列中下一个请求
                [self handleNextRequest];
                
                request.callback(error);
                
            });
            
        }];
        
    });
}

- (void)handleNextRequest
{
    XSCoreDataRequest *request = [self.requests lastObject];
    if(request)
    {
        [self executeRequest:request];
    }
    
}

/* 本地数据库路径 */
- (NSString *)appDbPath
{
    NSURL *URL = [[[NSFileManager defaultManager]
                   URLsForDirectory:NSDocumentDirectory
                   inDomains:NSUserDomainMask] lastObject];
    
    NSString *path = [[URL path] stringByAppendingPathComponent:self.dbName];
    
    return path;
    
}

- (NSManagedObjectContext *)moc
{
    if(_moc == nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:self.dbModelName
                                                  withExtension:@"momd"];
        
        NSManagedObjectModel* objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        
        [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator* storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:objectModel];
        
        NSURL *storeUrl = [NSURL fileURLWithPath:[self appDbPath]];
        NSError *error = nil;
        
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
                                 nil];
        
        if (![storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error])
        {
            NSAssert(0, @"persist init failed!");
        }
        
        NSManagedObjectContext* moc = [[NSManagedObjectContext alloc] init];
        [moc setPersistentStoreCoordinator:storeCoordinator];
        
        _moc = moc;
    }
    
    return _moc;
}

@end
