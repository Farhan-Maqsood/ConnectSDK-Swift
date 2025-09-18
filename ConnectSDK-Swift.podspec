Pod::Spec.new do |s|  
  s.name             = 'ConnectSDK-Swift'
  s.version          = '1.0.1'
  s.summary          = 'Connect SDK Swift version with all TV modules included'
  s.description      = <<-DESC
ConnectSDK-Swift enables discovery and connection to multiple devices 
such as FireTV, Google Cast, LGCast, and more. All modules are included by default.
  DESC

  s.homepage         = 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Farhan Maqsood' => 'farhanmaqsood44@gmail.com' }
  s.source           = { :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.swift_version    = '5.0'
  s.module_name      = 'ConnectSDK'

  s.source_files = [
    'ConnectSDK-Swift/**/*.{h,m,swift}',
    '!ConnectSDK-Swift/Frameworks/LGCast/**/*'
  ]
  s.public_header_files = [
    'ConnectSDK-Swift/**/*.h',
    '!ConnectSDK-Swift/Frameworks/LGCast/**/*'
  ]
  s.vendored_frameworks = [
    'ConnectSDK-Swift/Frameworks/LGCast/LGCast.xcframework',
    'ConnectSDK-Swift/Frameworks/LGCast/GStreamerForLGCast.xcframework'
  ]

  # Dependencies: must point to proper podspec repos
  s.dependency 'ConnectSDK-Swift-Core', '~> 1.0.2'
  s.dependency 'ConnectSDK-Swift-FireTV', '~> 1.0.0'
  s.dependency 'ConnectSDK-Swift-GoogleCast', '~> 1.0.0'

  s.requires_arc = true
  s.frameworks = ['SystemConfiguration', 'CoreBluetooth']
  s.libraries  = ['z', 'icucore']
  s.xcconfig = { "OTHER_LDFLAGS" => "$(inherited) -ObjC" }
end

