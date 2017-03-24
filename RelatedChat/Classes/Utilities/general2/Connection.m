//
// Copyright (c) 2016 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "utilities.h"

@implementation Connection

//-------------------------------------------------------------------------------------------------------------------------------------------------
+ (Connection *)shared
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	static dispatch_once_t once;
	static Connection *connection;
	//---------------------------------------------------------------------------------------------------------------------------------------------
	dispatch_once(&once, ^{ connection = [[Connection alloc] init]; });
	//---------------------------------------------------------------------------------------------------------------------------------------------
	return connection;
}

#pragma mark - Instance methods

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (id)init
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	self = [super init];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	self.reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
	[self.reachability startNotifier];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	[NotificationCenter addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	return self;
}

#pragma mark - Reachability methods

//-------------------------------------------------------------------------------------------------------------------------------------------------
+ (BOOL)isReachable
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	return [self shared].reachability.isReachable;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
+ (BOOL)isReachableViaWWAN
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	return [self shared].reachability.isReachableViaWWAN;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
+ (BOOL)isReachableViaWiFi
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	return [self shared].reachability.isReachableViaWiFi;
}

#pragma mark -

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)reachabilityChanged:(NSNotification *)notification
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
}

@end

