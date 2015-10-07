//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISCard.h"
#import "FISCardDeck.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISCard * cardN = [[FISCard alloc] init];
    NSLog(@"carN = %@", [cardN description]);
    
    FISCardDeck * cardDeck = [[FISCardDeck alloc] init];
    NSLog(@"CardDeck %@", [cardDeck description]);
    
    return YES;
}

@end
