//
//  main.m
//  8_JsonToOC2
//
//  Created by benlu on 2/25/15.
//  Copyright (c) 2015 benlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "object.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:@"http://benluwebapi.azurewebsites.net/api/values"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        //取得Json資訊
       NSArray* jsonobj = [NSJSONSerialization JSONObjectWithData:data
                                                                options:NSJSONReadingMutableContainers
                                                                  error:nil];
        
        //列印出所有內容
        //NSLog(@"%@",jsonobj);
        // 取得NSArray陣列資料，並且轉換成NSDictionary
//        NSDictionary* array1 = [jsonobj objectAtIndex:0];
//        //列印出Key and Value
//        [array1 enumerateKeysAndObjectsUsingBlock:^(id key,id obj,BOOL *stop){
//            NSLog(@"obj= %@ ",obj);
//            NSLog(@"key= %@", key);
//        }];
        

        //迭代的列出所有Json資料中的Key與Value
        [jsonobj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            NSDictionary* array1 = [jsonobj objectAtIndex:idx];
            
            [array1 enumerateKeysAndObjectsUsingBlock:^(id key,id obj,BOOL *stop){
                NSLog(@"key= %@ , Value = %@ ",key,obj);
                        }];
        }];
        
        
    }
    return 0;
}
