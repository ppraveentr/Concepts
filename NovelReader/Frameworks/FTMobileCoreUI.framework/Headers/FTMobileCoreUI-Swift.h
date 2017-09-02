// Generated by Apple Swift version 3.1 (swiftlang-802.0.53 clang-802.0.42)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
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

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if defined(__has_attribute) && __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
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
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
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
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
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
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
@import Foundation;
@import FTCoreUtility;
@import WebKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIViewController;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC14FTMobileCoreUI26FTBaseNavigationController")
@interface FTBaseNavigationController : UINavigationController
- (nonnull instancetype)initWithNavigationBarClass:(Class _Nullable)navigationBarClass toolbarClass:(Class _Nullable)toolbarClass OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=5.0);
- (nonnull instancetype)initWithRootViewController:(UIViewController * _Nonnull)rootViewController OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI22FTBaseTabBarController")
@interface FTBaseTabBarController : UITabBarController
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class FTBaseView;
@class FTView;

SWIFT_CLASS("_TtC14FTMobileCoreUI20FTBaseViewController")
@interface FTBaseViewController : UIViewController
@property (nonatomic, strong) IBOutlet FTBaseView * _Nullable baseView;
- (void)loadView;
- (BOOL)shouldSetTopLayoutGuide SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, strong) FTView * _Nullable mainView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class FTCoreTableViewController;
@class FTTableView;

SWIFT_CLASS("_TtC14FTMobileCoreUI25FTBaseTableViewController")
@interface FTBaseTableViewController : FTBaseViewController
@property (nonatomic, strong) FTCoreTableViewController * _Nonnull tableViewController;
@property (nonatomic, readonly, strong) FTTableView * _Nonnull tableView;
- (FTCoreTableViewController * _Nonnull)class_TableViewController SWIFT_WARN_UNUSED_RESULT;
- (UITableViewStyle)class_TableViewStyle SWIFT_WARN_UNUSED_RESULT;
- (void)loadView;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;

@interface FTBaseTableViewController (SWIFT_EXTENSION(FTMobileCoreUI)) <UITableViewDelegate>
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForFooterInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
@end


@interface FTBaseTableViewController (SWIFT_EXTENSION(FTMobileCoreUI))
- (void)viewDidLayoutSubviews;
@end

@class UITableViewCell;

@interface FTBaseTableViewController (SWIFT_EXTENSION(FTMobileCoreUI)) <UITableViewDataSource>
- (CGFloat)tableView:(UITableView * _Nonnull)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI6FTView")
@interface FTView : FTUIView
- (void)layoutSubviews;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI10FTBaseView")
@interface FTBaseView : FTView
@property (nonatomic, strong) FTView * _Nonnull rootView;
@property (nonatomic, strong) FTView * _Nullable topPinnedView;
@property (nonatomic, strong) FTView * _Nonnull mainPinnedView;
@property (nonatomic, strong) FTView * _Nullable bottomPinnedView;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;

@interface FTBaseView (SWIFT_EXTENSION(FTMobileCoreUI))
- (void)addSubview:(UIView * _Nonnull)view SWIFT_DEPRECATED;
@end



@interface FTBaseViewController (SWIFT_EXTENSION(FTMobileCoreUI))
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI8FTButton")
@interface FTButton : FTUIButton
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI12FTScrollView")
@interface FTScrollView : UIScrollView
@property (nonatomic, strong) FTView * _Nonnull contentView;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class FTWebView;

SWIFT_CLASS("_TtC14FTMobileCoreUI13FTContentView")
@interface FTContentView : FTScrollView
@property (nonatomic, strong) FTWebView * _Nonnull webView;
- (void)observeValueForKeyPath:(NSString * _Nullable)keyPath ofObject:(id _Nullable)object change:(NSDictionary<NSKeyValueChangeKey, id> * _Nullable)change context:(void * _Nullable)context;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI25FTCoreTableViewController")
@interface FTCoreTableViewController : UITableViewController
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)loadView;
- (void)setupCustomeTableView;
- (FTTableView * _Nonnull)getFTTableView SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI27FTExtendedNavigationBarView")
@interface FTExtendedNavigationBarView : FTView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI14FTFloatingView")
@interface FTFloatingView : FTView
+ (FTFloatingView * _Nonnull)configFloatingViewWithView:(UIView * _Nonnull)view SWIFT_WARN_UNUSED_RESULT;
/// is floating view showing
@property (nonatomic) BOOL isShowing;
/// Initilization of FTFloatingView
/// \param view A normal view that turns to floating view.
///
/// \param layer The layer of Z that the View will be presented, by default it is 1. in case of have more windows change it.
///
- (nonnull instancetype)initWith:(UIView * _Nonnull)view layer:(CGFloat)layer OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/// Showing floating view
- (void)show;
/// Hidding floating view
- (void)hide;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end

@class NSTextStorage;
@class NSTextContainer;
@class NSLayoutManager;
@class NSAttributedString;

SWIFT_CLASS("_TtC14FTMobileCoreUI7FTLabel")
@interface FTLabel : FTUILabel <NSLayoutManagerDelegate>
@property (nonatomic, strong) NSTextStorage * _Nonnull textStorage;
@property (nonatomic, strong) NSTextContainer * _Nonnull textContainer;
@property (nonatomic, strong) NSLayoutManager * _Nonnull layoutManager;
@property (nonatomic, copy) NSString * _Nullable text;
@property (nonatomic, strong) NSAttributedString * _Nullable attributedText;
@property (nonatomic) CGRect frame;
@property (nonatomic) CGRect bounds;
@property (nonatomic) CGFloat preferredMaxLayoutWidth;
@property (nonatomic) NSInteger numberOfLines;
- (void)layoutSubviews;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface FTLabel (SWIFT_EXTENSION(FTMobileCoreUI))
@end


@interface FTLabel (SWIFT_EXTENSION(FTMobileCoreUI))
@end


@interface FTLabel (SWIFT_EXTENSION(FTMobileCoreUI))
- (void)drawTextInRect:(CGRect)rect;
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines SWIFT_WARN_UNUSED_RESULT;
@end


@interface FTLabel (SWIFT_EXTENSION(FTMobileCoreUI))
@end


@interface FTLabel (SWIFT_EXTENSION(FTMobileCoreUI))
@property (nonatomic) BOOL theme_linkUndelineEnabled;
@property (nonatomic) BOOL theme_linkDetectionEnabled;
@end


@class UIFont;
@class UIColor;

SWIFT_CLASS("_TtC14FTMobileCoreUI11FTSearchBar")
@interface FTSearchBar : UISearchBar
- (nonnull instancetype)initWithFrame:(CGRect)frame font:(UIFont * _Nullable)font textColor:(UIColor * _Nullable)textColor OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)drawRect:(CGRect)rect;
- (void)configureWithBarTintColor:(UIColor * _Nullable)barTintColor tintColor:(UIColor * _Nullable)tintColor textColor:(UIColor * _Nullable)textColor;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI11FTTableView")
@interface FTTableView : UITableView
- (void)setTableHeaderViewWithView:(UIView * _Nullable)view;
- (void)setTableFooterViewWithView:(UIView * _Nullable)view;
- (nonnull instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC14FTMobileCoreUI27FTTableViewHeaderFooterView")
@interface FTTableViewHeaderFooterView : FTView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@class WKWebViewConfiguration;

SWIFT_CLASS("_TtC14FTMobileCoreUI9FTWebView")
@interface FTWebView : WKWebView
- (void)setScrollEnabledWithEnabled:(BOOL)enabled;
- (nonnull instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration * _Nonnull)configuration OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImage;

@interface UINavigationBar (SWIFT_EXTENSION(FTMobileCoreUI))
/// Configures the navigation bar to use an image as its background.
+ (void)applyBackgroundImageWithNavigationBar:(UINavigationBar * _Nullable)navigationBar defaultImage:(UIImage * _Nonnull)defaultImage landScapeImage:(UIImage * _Nonnull)landScape;
/// Configures the navigation bar to use a transparent background (see-through
/// but without any blur).
+ (void)applyTransparentBackgroundWithNavigationBar:(UINavigationBar * _Nullable)navigationBar :(CGFloat)opacity;
/// Configures the navigation bar to use a custom color as its background.
/// The navigation bar remains translucent.
+ (void)applyTintColorWithNavigationBar:(UINavigationBar * _Nullable)navigationBar :(UIColor * _Nonnull)color;
@end

#pragma clang diagnostic pop