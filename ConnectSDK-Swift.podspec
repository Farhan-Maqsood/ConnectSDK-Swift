Pod::Spec.new do |s|  
  s.name             = 'ConnectSDK-Swift'
  s.version          = '1.0.1'
  s.summary          = 'Connect SDK Swift version with all TV modules included'
  s.description      = 'ConnectSDK-Swift enables discovery and connection to multiple devices like FireTV, Google Cast, LGCast, and more.'

  s.homepage         = 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Farhan Maqsood' => 'farhanmaqsood44@gmail.com' }
  s.source           = { :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.module_name   = 'ConnectSDK'
  s.static_framework = true

  # Default subspec to include all
  s.default_subspec = 'Complete'

  # Core subspec
  s.subspec 'Core' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core', '~> 1.0.2'
  end

  # FireTV module
  s.subspec 'FireTV' do |sp|
    sp.dependency 'ConnectSDK-Swift/Core'
    sp.dependency 'ConnectSDK-Swift-FireTV', '~> 1.0.0'
  end

  # GoogleCast module
  s.subspec 'GoogleCast' do |sp|
    sp.dependency 'ConnectSDK-Swift/Core'
    sp.dependency 'ConnectSDK-Swift-GoogleCast', '~> 1.0.0'
    sp.dependency 'google-cast-sdk', '~> 4.8'
  end

  # Complete subspec with all modules
  s.subspec 'Complete' do |sp|
    sp.dependency 'ConnectSDK-Swift/Core'
    sp.dependency 'ConnectSDK-Swift/FireTV'
    sp.dependency 'ConnectSDK-Swift/GoogleCast'
  end

  s.requires_arc = true
  s.frameworks = ['SystemConfiguration', 'CoreBluetooth']
  s.libraries  = ['z', 'icucore']
  
  s.xcconfig = { 
    "OTHER_LDFLAGS" => "$(inherited) -ObjC",
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
    "DEFINES_MODULE" => "YES"
  }
end
