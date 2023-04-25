#import <Foundation/Foundation.h>
#include <unistd.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    	NSLog(@"Test is starting ....");
    }
    unsigned int num;
	while(1) {
        printf("pid:%d, auto increment num:%d\n",getpid(),num++);
        sleep(5);
    }
    return 0;
}
