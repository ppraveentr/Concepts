// Generated by Apple Swift version 4.1 (swiftlang-902.0.48 clang-902.0.37.1)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import UIKit;
@import CoreGraphics;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="FTCoreUtility",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC13FTCoreUtility13FTAppDelegate")
@interface FTAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions SWIFT_WARN_UNUSED_RESULT;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSCoder;

SWIFT_CLASS("_TtC13FTCoreUtility10FTUIButton")
@interface FTUIButton : UIButton
- (NSString * _Nullable)get_ThemeSubType SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'FTUIButton.get_ThemeSubType()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)updateTheme:(NSDictionary<NSString *, id> * _Nonnull)theme SWIFT_DEPRECATED_OBJC("Swift method 'FTUIButton.updateTheme(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)updateWithThemeDic:(NSDictionary<NSString *, id> * _Nonnull)themeDic state:(UIControlState)state SWIFT_DEPRECATED_OBJC("Swift method 'FTUIButton.update(themeDic:state:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13FTCoreUtility10FTUITabBar")
@interface FTUITabBar : UITabBar
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13FTCoreUtility8FTUIView")
@interface FTUIView : UIView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImage;

@interface UIColor (SWIFT_EXTENSION(FTCoreUtility))
- (nonnull instancetype)initWithRgb:(uint32_t)rgb a:(CGFloat)a SWIFT_DEPRECATED_OBJC("Swift initializer 'UIColor.init(rgb:a:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nonnull instancetype)initWithRgba:(uint32_t)rgba SWIFT_DEPRECATED_OBJC("Swift initializer 'UIColor.init(rgba:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (NSString * _Nonnull)hexString SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIColor.hexString()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
+ (UIColor * _Nullable)hexColor:(NSString * _Nonnull)hex SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIColor.hexColor(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (UIImage * _Nonnull)generateImageWithOpacity:(CGFloat)opacity contextSize:(CGSize)contextSize contentsScale:(CGFloat)contentsScale SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIColor.generateImage(opacity:contextSize:contentsScale:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (UIColor * _Nonnull)lighterColor:(CGFloat)amount SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIColor.lighterColor(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (UIColor * _Nonnull)darkerColor:(CGFloat)amount SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIColor.darkerColor(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
+ (UIColor * _Nonnull)blendColorsWithColor:(UIColor * _Nonnull)color destinationColor:(UIColor * _Nonnull)destinationColor amount:(CGFloat)amount SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIColor.blendColors(color:destinationColor:amount:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UIControl (SWIFT_EXTENSION(FTCoreUtility))
- (BOOL)get_AllThemeSubType SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIControl.get_AllThemeSubType()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)setThemes:(NSDictionary<NSString *, id> * _Nonnull)themes SWIFT_DEPRECATED_OBJC("Swift method 'UIControl.setThemes(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UIImage (SWIFT_EXTENSION(FTCoreUtility))
+ (UIImage * _Nullable)named:(NSString * _Nonnull)named SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIImage.named(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UIImage (SWIFT_EXTENSION(FTCoreUtility))
- (UIColor * _Nullable)getColorAtPoint:(CGPoint)atPoint a:(CGFloat)a SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIImage.getColor(atPoint:a:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UIImageView (SWIFT_EXTENSION(FTCoreUtility))
/// Download Image from async in background
/// \param url Image’s url from which need to download
///
/// \param contentMode ImageView’s content mode, defalut to ‘scaleAspectFit’
///
- (void)downloadedFromUrl:(NSURL * _Nonnull)url contentMode:(UIViewContentMode)mode comletionHandler:(void (^ _Nullable)(void))comletionHandler SWIFT_DEPRECATED_OBJC("Swift method 'UIImageView.downloadedFrom(url:contentMode:comletionHandler:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
/// Download Image from async in background
/// \param link Image’s urlString from which need to download
///
/// \param contentMode ImageView’s content mode, defalut to ‘scaleAspectFit’
///
- (void)downloadedFromLink:(NSString * _Nonnull)link contentMode:(UIViewContentMode)mode comletionHandler:(void (^ _Nullable)(void))comletionHandler SWIFT_DEPRECATED_OBJC("Swift method 'UIImageView.downloadedFrom(link:contentMode:comletionHandler:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end

@class UIFont;

@interface UILabel (SWIFT_EXTENSION(FTCoreUtility))
- (void)theme_isLinkUnderlineEnabled:(BOOL)bool_ SWIFT_DEPRECATED_OBJC("Swift method 'UILabel.theme_isLinkUnderlineEnabled(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)theme_isLinkDetectionEnabled:(BOOL)bool_ SWIFT_DEPRECATED_OBJC("Swift method 'UILabel.theme_isLinkDetectionEnabled(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)theme_textfont:(UIFont * _Nonnull)font SWIFT_DEPRECATED_OBJC("Swift method 'UILabel.theme_textfont(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)theme_textcolor:(UIColor * _Nonnull)color SWIFT_DEPRECATED_OBJC("Swift method 'UILabel.theme_textcolor(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)updateVisualThemes SWIFT_DEPRECATED_OBJC("Swift method 'UILabel.updateVisualThemes()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UINavigationBar (SWIFT_EXTENSION(FTCoreUtility))
+ (void)setUpAppearanceWithTheme:(NSDictionary<NSString *, id> * _Nonnull)theme inContainerClass:(NSString * _Nullable)cclassName;
+ (void)setBackgroundImage:(id _Nonnull)image;
@end


@interface UINavigationBar (SWIFT_EXTENSION(FTCoreUtility))
/// Configures the navigation bar to use an image as its background.
+ (void)applyBackgroundImageWithNavigationBar:(UINavigationBar * _Nullable)navigationBar defaultColor:(UIColor * _Nonnull)defaultColor landScapeColor:(UIColor * _Nullable)landScape SWIFT_DEPRECATED_OBJC("Swift method 'UINavigationBar.applyBackgroundImage(navigationBar:defaultColor:landScapeColor:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
/// Configures the navigation bar to use an image as its background.
+ (void)applyBackgroundImageWithNavigationBar:(UINavigationBar * _Nullable)navigationBar defaultImage:(UIImage * _Nonnull)defaultImage landScapeImage:(UIImage * _Nullable)landScape SWIFT_DEPRECATED_OBJC("Swift method 'UINavigationBar.applyBackgroundImage(navigationBar:defaultImage:landScapeImage:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
/// Configures the navigation bar to use a transparent background (see-through
/// but without any blur).
+ (void)applyTransparentBackgroundWithNavigationBar:(UINavigationBar * _Nullable)navigationBar :(CGFloat)opacity SWIFT_DEPRECATED_OBJC("Swift method 'UINavigationBar.applyTransparentBackground(navigationBar:_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
/// Configures the navigation bar to use a custom color as its background.
/// The navigation bar remains translucent.
+ (void)applyTintColorWithNavigationBar:(UINavigationBar * _Nullable)navigationBar :(UIColor * _Nonnull)color SWIFT_DEPRECATED_OBJC("Swift method 'UINavigationBar.applyTintColor(navigationBar:_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UISegmentedControl (SWIFT_EXTENSION(FTCoreUtility))
+ (void)setUpAppearanceWithTheme:(NSDictionary<NSString *, id> * _Nonnull)theme inContainerClass:(NSString * _Nullable)cclassName;
+ (void)setBackgroundImageWithImageType:(NSString * _Nonnull)imageType image:(UIImage * _Nonnull)image SWIFT_DEPRECATED_OBJC("Swift method 'UISegmentedControl.setBackgroundImage(imageType:image:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UITabBar (SWIFT_EXTENSION(FTCoreUtility))
+ (void)setBackgroundImage:(id _Nonnull)image;
@end




@interface UIView (SWIFT_EXTENSION(FTCoreUtility))
- (void)swizzled_updateTheme:(NSDictionary<NSString *, id> * _Nonnull)theme;
- (void)theme_backgroundColor:(UIColor * _Nonnull)color SWIFT_DEPRECATED_OBJC("Swift method 'UIView.theme_backgroundColor(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UIView (SWIFT_EXTENSION(FTCoreUtility))
- (NSArray<UIImageView *> * _Nullable)findShadowImage SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIView.findShadowImage()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)hideShadowImage SWIFT_DEPRECATED_OBJC("Swift method 'UIView.hideShadowImage()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UIView (SWIFT_EXTENSION(FTCoreUtility))
- (void)setUpAppearanceWithTheme:(NSDictionary<NSString *, id> * _Nonnull)theme inContainerClass:(NSString * _Nullable)cclassName SWIFT_DEPRECATED_OBJC("Swift method 'UIView.setUpAppearance(theme:inContainerClass:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
+ (void)setUpAppearanceWithTheme:(NSDictionary<NSString *, id> * _Nonnull)theme inContainerClass:(NSString * _Nullable)cclassName SWIFT_DEPRECATED_OBJC("Swift method 'UIView.setUpAppearance(theme:inContainerClass:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
+ (void)setBackgroundImage:(id _Nonnull)imageTheme SWIFT_DEPRECATED_OBJC("Swift method 'UIView.setBackgroundImage(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
+ (void)setBackgroundImageWithImageType:(NSString * _Nullable)imageType imageName:(id _Nonnull)imageName SWIFT_DEPRECATED_OBJC("Swift method 'UIView.setBackgroundImage(imageType:imageName:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end

@class UINib;

@interface UIView (SWIFT_EXTENSION(FTCoreUtility))
+ (UIView * _Nonnull)embedViewWithContentView:(UIView * _Nonnull)contentView SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIView.embedView(contentView:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)removeSubviews SWIFT_DEPRECATED_OBJC("Swift method 'UIView.removeSubviews()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)removeAllConstraints SWIFT_DEPRECATED_OBJC("Swift method 'UIView.removeAllConstraints()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
+ (UINib * _Nullable)getNIBFile SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIView.getNIBFile()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
+ (UIView * _Nullable)fromNib:(id _Nullable)owner SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIView.fromNib(_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
+ (UIView * _Nullable)fromNibWithNamed:(NSString * _Nonnull)name owner:(id _Nullable)owner SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift method 'UIView.fromNib(named:owner:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)xibSetupWithClassName:(SWIFT_METATYPE(UIView) _Nonnull)className SWIFT_DEPRECATED_OBJC("Swift method 'UIView.xibSetup(className:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end




@interface UIView (SWIFT_EXTENSION(FTCoreUtility))
- (void)addSizeConstraint:(CGFloat)width :(CGFloat)height SWIFT_DEPRECATED_OBJC("Swift method 'UIView.addSizeConstraint(_:_:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)addSelfSizing SWIFT_DEPRECATED_OBJC("Swift method 'UIView.addSelfSizing()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)resizeToFitSubviewsInScreen SWIFT_DEPRECATED_OBJC("Swift method 'UIView.resizeToFitSubviewsInScreen()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)resizeToFitSubviews SWIFT_DEPRECATED_OBJC("Swift method 'UIView.resizeToFitSubviews()' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)setViewSize:(CGSize)size createConstraint:(BOOL)createConstraint relation:(NSLayoutRelation)relation SWIFT_DEPRECATED_OBJC("Swift method 'UIView.setViewSize(_:createConstraint:relation:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)setViewHeight:(CGFloat)height createConstraint:(BOOL)createConstraint relation:(NSLayoutRelation)relation SWIFT_DEPRECATED_OBJC("Swift method 'UIView.setViewHeight(_:createConstraint:relation:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)setViewWidth:(CGFloat)width createConstraint:(BOOL)createConstraint relation:(NSLayoutRelation)relation SWIFT_DEPRECATED_OBJC("Swift method 'UIView.setViewWidth(_:createConstraint:relation:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


@interface UIView (SWIFT_EXTENSION(FTCoreUtility))
@property (nonatomic, copy) NSString * _Nullable theme;
@property (nonatomic) BOOL needsThemesUpdate SWIFT_DEPRECATED_OBJC("Swift property 'UIView.needsThemesUpdate' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)prepareForInterfaceBuilder;
@end


@interface UIViewController (SWIFT_EXTENSION(FTCoreUtility))
- (void)postNotificationWithName:(NSNotificationName _Nonnull)name object:(id _Nullable)object SWIFT_DEPRECATED_OBJC("Swift method 'UIViewController.postNotification(name:object:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
