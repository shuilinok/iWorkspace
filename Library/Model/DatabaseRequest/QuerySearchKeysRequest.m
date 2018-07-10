//
//  QuerySearchKeysRequest.m
//  MVVM
//
//  Created by shuilin on 07/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "QuerySearchKeysRequest.h"
#import "SearchHistoryEntity+CoreDataProperties.h"

@interface QuerySearchKeysRequest ()

@property (strong, nonatomic) NSArray *keys;

@end


@implementation QuerySearchKeysRequest

- (void)execute:(NSManagedObjectContext *)moc callback:(dispatch_block_t)callback
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SearchHistoryEntity" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self executeFetchRequest:fetchRequest error:&error moc:moc];
    
    NSMutableArray *infos = [[NSMutableArray alloc] init];
    for(SearchHistoryEntity *object in fetchedObjects)
    {
        [infos addObject:object.key];
    }
    
    self.keys = infos;
    
    callback();
}

@end
