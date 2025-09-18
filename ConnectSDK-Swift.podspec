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

  s.ios.deployment_target = '12.0'
  s.swift_version    = '5.0'
  s.module_name      = 'ConnectSDK'

  # Include all sources **except LGCast/GStreamer frameworks**
  s.source_files = [
    'ConnectSDK-Swift/**/*.{h,m,swift}',
    '!ConnectSDK-Swift/Frameworks/LGCast/**/*'
  ]
  s.public_header_files = [
    'ConnectSDK-Swift/**/*.h',
    '!ConnectSDK-Swift/Frameworks/LGCast/**/*'
  ]

  # Vendored frameworks only (LGCast + GStreamer)
  s.vendored_frameworks = [
    'ConnectSDK-Swift/Frameworks/LGCast/LGCast.xcframework',
    'ConnectSDK-Swift/Frameworks/LGCast/GStreamerForLGCast.xcframework'
  ]

  # Core dependency
  s.dependency 'ConnectSDK-Swift-Core', '~> 1.0.2'

  # FireTV subspec (compiled from sources)
  s.subspec 'FireTV' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core'
    sp.source       = { :git => 'https://github.com/Farhan-Maqsood/Connect-SDK-Swift-FireTV.git', :tag => '1.0.0' }
    sp.source_files = 'Connect-SDK-Swift-FireTV/**/*.{h,m,swift}'
  end

  # GoogleCast subspec (compiled from sources)
  s.subspec 'GoogleCast' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core'
    sp.source       = { :git => 'https://github.com/Farhan-Maqsood/Connect-SDK-Swift-Google-Cast.git', :tag => '1.0.0' }
    sp.source_files = 'Connect-SDK-Swift-Google-Cast/**/*.{h,m,swift}'
  end

  # Complete subspec for single import
  s.default_subspec = 'Complete'
  s.subspec 'Complete' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core'
    sp.dependency 'ConnectSDK-Swift/FireTV'
    sp.dependency 'ConnectSDK-Swift/GoogleCast'
    # LGCast is already vendored in Core, no sources compiled -> no duplicate headers
  end

  # Pod configs
  s.requires_arc = true
  s.frameworks = ['SystemConfiguration', 'CoreBluetooth']
  s.libraries  = ['z', 'icucore']
  s.xcconfig = { "OTHER_LDFLAGS" => "$(inherited) -ObjC" }
end

