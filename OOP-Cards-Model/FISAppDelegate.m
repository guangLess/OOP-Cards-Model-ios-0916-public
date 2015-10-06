//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISCard.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISCard * cardN = [[FISCard alloc] init];
    NSLog(@"carN = %@", [cardN description]);
    return YES;
}

@end
