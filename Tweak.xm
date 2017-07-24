

#define BUNDLE [NSBundle bundleWithPath:@"/Library/PreferenceBundles/preferenceBundleDemo.bundle"]


typedef void (^CDUnknownBlockType)(void);

#import "tweakExternal.h"

%hook SBDockView

- (void)setBackgroundAlpha:(float)arg1{
NSString *path = @"/var/mobile/Library/Preference/com.adong.preferenceBundleDemo.plist";
NSDictionary *dataDic =[NSDictionary dictionaryWithContentsOfFile:path];
arg1=0.2;
NSLog(@"--------SBDockView-setBackgroundAlpha:%f---dataDic=%@",arg1,dataDic);
%orig;
}

- (void)_backgroundContrastDidChange:(id)arg1{
NSString *path = [BUNDLE pathForResource:@"Info" ofType:@"plist"];
NSLog(@"--------SBDockView-_backgroundContrastDidChange:%@---path=%@",arg1,path);
NSDictionary *dataDic =[NSDictionary dictionaryWithContentsOfFile:path];
NSLog(@"--------SBDockView-_backgroundContrastDidChange:dataDic=%@",dataDic);
%orig;
[self setBackgroundAlpha:0.2];
}


%end



