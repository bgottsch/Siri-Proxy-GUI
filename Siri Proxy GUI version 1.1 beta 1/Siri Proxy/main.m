//
//  main.m
//  Siri Proxy
//
//  Created by Beno Gottschalk Sarfati on 2/23/13.
//  Copyright (c) 2013 Beno Gottschalk Sarfati. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, char *argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, (const char **)argv);
}
