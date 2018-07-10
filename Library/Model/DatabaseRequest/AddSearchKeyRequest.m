//
//  AddSearchKeyRequest.m
//  MVVM
//
//  Created by shuilin on 06/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "AddSearchKeyRequest.h"
#import "SearchHistoryEntity+CoreDataProperties.h"

@implementation AddSearchKeyRequest

- (SearchHistoryEntity *)firstSearchHistoryEntity:(NSString *)key moc:(NSManagedObjectContext *)moc
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SearchHistoryEntity" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"key = %@",key];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self executeFetchRequest:fetchRequest error:&error moc:moc];
    
    if(fetchedObjects.count > 0)
    {
        SearchHistoryEntity *object = [fetchedObjects objectAtIndex:0];
        return object;
    }
    
    return nil;
}

- (void)execute:(NSManagedObjectContext *)moc callback:(ResultCallback)callback
{
    if(self.key.length == 0)
    {
        callback(nil);
        return;
    }
    
    //已经存在
    if([self firstSearchHistoryEntity:self.key moc:moc] != nil)
    {
        callback(nil);
        return;
    }
    
    SearchHistoryEntity* entity;
    
    //插入新的
    entity = [NSEntityDescription insertNewObjectForEntityForName:@"SearchHistoryEntity" inManagedObjectContext:moc];
    entity.key = self.key;
    
    NSError *error = [self save:moc];
    
    callback(error);
}

@end
