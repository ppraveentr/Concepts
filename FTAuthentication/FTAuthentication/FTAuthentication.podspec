Pod::Spec.new do |s|  
    s.name              = 'FTAuthentication'
    s.version           = '1.0.0'
    s.summary           = 'A SDK for Authentication.'
    s.homepage          = 'https://github.com/ppraveentr/Concepts/tree/master/FTAuthentication'

    s.author            = { 'Name' => ‘ppraveentr@gmail.com’ }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :http => 'https://github.com/ppraveentr/CocoaPods/blob/master/FTAuthentication.zip' }

    s.ios.deployment_target = ‘9.0’
    s.ios.vendored_frameworks = 'FTAuthentication.framework'
end 
