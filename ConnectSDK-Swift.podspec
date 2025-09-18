Pod::Spec.new do |s|  
  s.name             = 'ConnectSDK-Swift'
  s.version          = '1.0.1'
  s.summary          = 'Connect SDK Swift version with Core and Google Cast modules'
  s.description      = <<-DESC
  ConnectSDK-Swift enables discovery and connection to multiple devices 
  including Google Cast, LG TVs, and more. Complete Swift version.
  DESC

  s.homepage         = 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Farhan Maqsood' => 'farhanmaqsood44@gmail.com' }
  s.source           = { :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.module_name   = 'ConnectSDK'
  s.static_framework = true

  # Dependencies
  s.dependency 'ConnectSDK-Swift-Core', '~> 1.0.2'
  s.dependency 'ConnectSDK-Swift-GoogleCast', '~> 1.0.0'
  s.dependency 'google-cast-sdk', '~> 4.8'

  s.requires_arc = true
  s.frameworks = ['SystemConfiguration', 'CoreBluetooth', 'Network']
  s.libraries  = ['z', 'icucore', 'c++']
  
  s.xcconfig = { 
    "OTHER_LDFLAGS" => "$(inherited) -ObjC",
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
    "DEFINES_MODULE" => "YES"
  }
end

