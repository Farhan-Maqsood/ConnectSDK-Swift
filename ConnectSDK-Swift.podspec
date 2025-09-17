Pod::Spec.new do |s|
  s.name         = "ConnectSDK-Swift"
  s.version      = "1.0.1"
  s.summary      = "ConnectSDK Swift SDK"
  s.description  = <<-DESC
    ConnectSDK Swift module for device discovery and communication.
    Handles high-level services and framework integration.
  DESC
  s.homepage     = "https://github.com/Farhan-Maqsood/ConnectSDK-Swift"
  s.license      = { :type => "Apache-2.0", :file => "LICENSE" }
  s.author       = { "Farhan Maqsood" => "farhanmaqsood44@gmail.com" }
  s.source       = { :git => "https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git", :tag => s.version }

  s.ios.deployment_target = "11.0"

  # Core source files (your own implementation)
  s.source_files = "core/**/*.{h,m}",
                   "modules/**/*.{h,m}",
                   "ConnectSDKDefaultPlatforms.h"

  s.private_header_files = "**/*_Private.h"

  # Precompiled LGCast and GStreamer frameworks
  s.vendored_frameworks = [
    "Frameworks/LGCast/LGCast.xcframework",
    "Frameworks/LGCast/GStreamerForLGCast.xcframework"
  ]

  # System libraries/frameworks
  s.libraries  = "z", "icucore"
  s.frameworks = "SystemConfiguration", "CoreBluetooth"

  # Prefix header macros
  s.prefix_header_contents = <<-PREFIX
    #define CONNECT_SDK_VERSION @"#{s.version}"
    #define CONNECT_SDK_ENABLE_LOG
  PREFIX

  # Example subspec (GoogleCast)
  s.subspec 'GoogleCast' do |sp|
    sp.dependency 'ConnectSDK-Swift/Core'
    sp.source_files = "modules/google-cast/**/*.{h,m}"
    sp.private_header_files = "modules/google-cast/**/*_Private.h"
  end
end

