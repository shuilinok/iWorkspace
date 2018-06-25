//
//  ClearSearchKeysRequest.m
//  MVVM
//
//  Created by shuilin on 07/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "ClearSearchKeysRequest.h"
#import "SearchHistoryEntity+CoreDataProperties.h"

@implementation ClearSearchKeysRequest

- (void)execute:(NSManagedObjectContext *)moc callback:(ResultCallback)callback
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SearchHistoryEntity" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self executeFetchRequest:fetchRequest error:&error moc:moc];
    
    for(SearchHistoryEntity *object in fetchedObjects)
    {
        [moc deleteObject:object];
    }
    
    error = [self save:moc];
    
    callback(error);
}

@end
