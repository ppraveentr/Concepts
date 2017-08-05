Pod::Spec.new do |s|  
    s.name              = "FTAuthentication"
    s.version           = "1.0"
    s.summary           = "A SDK for Authentication."
    s.homepage          = "https://github.com/ppraveentr/Concepts/tree/master/FTAuthentication"

    s.author            = { "PraveenP" => "ppraveentr@gmail.com" }
    s.license           = "MIT"

    s.source            = { :git => "https://github.com/ppraveentr/CocoaPods.git", :tag => "1.0" }

    s.platform		= :ios, "9.0"
    s.ios.deployment_target = '9.0'
    s.source_files = "*.{swift}"
    s.resources = "*.{png,jpeg,jpg,storyboard,xib}"
end 
