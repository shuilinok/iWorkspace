//
//  DMCourseSearchRequest.m
//  MVVM
//
//  Created by shuilin on 02/11/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "DMCourseSearchRequest.h"
#import "DictionaryHelper.h"

@interface DMCourseSearchRequest ()

@property (strong, nonatomic) NSArray *infos;

@end

@implementation DMCourseSearchRequest

- (void)send:(ResultCallback)callback
{
    FGHttpRequest *request = [[FGHttpRequest alloc] init];
    request.method = @"GET";
    
    NSString *url = [NSString stringWithFormat:@"%@://%@/%@",DMHostScheme,DMHost,@"api/v2/search"];
    request.url = url;
    
    request.headerDict = [DMHttpHeader basicHeaderDict];
    
    NSString *keyword = self.key ? : @"";
    NSString *type = @"all";
    NSString *limit = [NSString stringWithFormat:@"%d",self.limit];
    NSString *offset = [NSString stringWithFormat:@"%d",self.offset];
    NSString *courseId = @"";
    
    NSDictionary *paramDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               keyword, @"keyword",
                               type, @"type",
                               courseId, @"course_id",
                               offset, @"offset",
                               limit, @"limit",
                               @"0,1",@"course_type",
                               nil];
    
    request.paramDict = paramDict;
    
    [request send:^(NSError *error) {
        
        if(error.code == noErr)
        {
            NSDictionary *data = request.responseObject;
            if([data isKindOfClass:[NSDictionary class]])
            {
                NSArray *arr = [data arrayForKey:@"courses"];
                NSMutableArray *infos = [[NSMutableArray alloc] init];
                for(NSDictionary *dict in arr)
                {
                    SearchCourseInfo *info = [[SearchCourseInfo alloc] init];
                    info.thumbImageUrl = [dict stringForKey:@"thumbnail"];
                    info.name = [dict stringForKey:@"name"];
                    info.org_name = [dict stringForKey:@"org_name"];
                    
                    [infos addObject:info];
                }
                
                self.infos = infos;
            }
        }
        
        callback(error);
    }];
}

@end
