#import "ContentPlaceholderPlugin.h"
#if __has_include(<content_placeholder/content_placeholder-Swift.h>)
#import <content_placeholder/content_placeholder-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "content_placeholder-Swift.h"
#endif

@implementation ContentPlaceholderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftContentPlaceholderPlugin registerWithRegistrar:registrar];
}
@end
