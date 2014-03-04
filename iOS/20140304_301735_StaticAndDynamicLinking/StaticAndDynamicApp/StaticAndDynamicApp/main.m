//
//  main.m
//  StaticAndDynamicApp
//
//  Created by Stanislaw Pankevich on 04/03/14.
//  Copyright (c) 2014 Stanislaw Pankevich. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <StaticLibrary.h>
#import <DynamicLibrary.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        hello_static();
        hello_dynamic();
    }
    
    return 0;
}

