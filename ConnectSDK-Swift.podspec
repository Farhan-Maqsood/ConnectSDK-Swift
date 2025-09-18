kPod::Spec.new do |s|  
  s.name             = 'ConnectSDK-Swift'
  s.version          = '1.0.1'
  s.summary          = 'Connect SDK Swift version with all TV modules included'
  s.description      = 'ConnectSDK-Swift enables discovery and connection to multiple devices like FireTV, Google Cast, LGCast, and more.'

  s.homepage         = 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Farhan Maqsood' => 'farhanmaqsood44@gmail.com' }
  s.source           = { :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git', :tag => s.version.to_s }

  # Deployment & Swift
  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.module_name   = 'ConnectSDK'
  s.static_framework = true

  # Source files
  s.source_files = [
    'ConnectSDK-Swift/**/*.{h,m,swift}',
    '!ConnectSDK-Swift/Frameworks/LGCast/**/*'
  ]
  s.public_header_files = [
    'ConnectSDK-Swift/**/*.h',
    '!ConnectSDK-Swift/Frameworks/LGCast/**/*'
  ]

  # Vendored frameworks
  s.vendored_frameworks = [
    'ConnectSDK-Swift/Frameworks/LGCast/LGCast.xcframework',
    'ConnectSDK-Swift/Frameworks/LGCast/GStreamerForLGCast.xcframework'
  ]

  # Core dependency
  s.dependency 'ConnectSDK-Swift-Core', '~> 1.0.2'

  # FireTV module
  s.subspec 'FireTV' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core'
    sp.source       = { :git => 'https://github.com/Farhan-Maqsood/Connect-SDK-Swift-FireTV.git', :tag => '1.0.0' }
    sp.source_files = 'Connect-SDK-Swift-FireTV/**/*.{h,m,swift}'
  end

  # GoogleCast module
  s.subspec 'GoogleCast' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core'
    sp.source       = { :git => 'https://github.com/Farhan-Maqsood/Connect-SDK-Swift-Google-Cast.git', :tag => '1.0.0' }
    sp.source_files = 'Connect-SDK-Swift-Google-Cast/**/*.{h,m,swift}'
    sp.dependency 'google-cast-sdk', '~> 4.8'
  end

  # Default subspec to include all
  s.default_subspec = 'Complete'
  s.subspec 'Complete' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core'
    sp.dependency 'ConnectSDK-Swift/FireTV'
    sp.dependency 'ConnectSDK-Swift/GoogleCast'
  end

  # Pod configs
  s.requires_arc = true
  s.frameworks = ['SystemConfiguration', 'CoreBluetooth']
  s.libraries  = ['z', 'icucore']
  s.xcconfig = { 
    "OTHER_LDFLAGS" => "$(inherited) -ObjC",
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
    "DEFINES_MODULE" => "YES",
    "BUILD_LIBRARY_FOR_DISTRIBUTION" => "YES"
  }
end

