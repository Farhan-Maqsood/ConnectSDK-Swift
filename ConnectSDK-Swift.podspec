Pod::Spec.new do |s|
  s.name             = 'ConnectSDK-Swift'
  s.version          = '1.0.2'  # Incremented version to push new changes
  s.summary          = 'Connect SDK Swift version with Core, Google Cast, and FireTV modules'
  s.description      = "Complete Swift SDK enabling discovery and connection to multiple devices."
  s.homepage         = 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Farhan Maqsood' => 'farhanmaqsood44@gmail.com' }
  s.source           = { :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.static_framework = true
  s.requires_arc = true

  # Include all source files, explicitly add missing header
  s.source_files = [
    "ConnectSDKDefaultPlatforms.h",   # Explicitly include missing file
    "**/*.{h,m,swift}"
  ]

  # Public headers
  s.public_header_files = [
    "ConnectSDKDefaultPlatforms.h",
    "**/*.h"
  ]

  # Dependencies with specific tags
  s.dependency 'ConnectSDK-Swift-Core', :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift-Core.git', :tag => '1.0.3'
  s.dependency 'ConnectSDK-Swift-FireTV', :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift-FireTV.git', :tag => '1.0.0'
  s.dependency 'ConnectSDK-Swift-GoogleCast', :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift-GoogleCast.git', :tag => '1.0.0'

  # Frameworks and libraries
  s.frameworks = ['SystemConfiguration','CoreBluetooth','Network']
  s.libraries = ['z','icucore','c++']

  # Critical build settings
  s.xcconfig = {
    "OTHER_LDFLAGS" => "$(inherited) -ObjC",
    "DEFINES_MODULE" => "YES",
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES"
  }
end

