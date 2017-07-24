#include "AdgRootListController.h"

@implementation AdgRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}
    //NSLog(@"------specifiers:%@",_specifiers);
	return _specifiers;
}

@end
