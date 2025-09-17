Pod::Spec.new do |s|
  # 🔹 New name so Apple sees it as a different library
  s.name         = "ConnectSDK-Swift"
  s.version      = "1.0.0"
  s.summary      = "Modernized Connect SDK with Swift module support"

  s.description  = <<-DESC
  ConnectSDK-Swift is a maintained fork of the original Connect SDK.

  It provides the same multi-device discovery and casting capabilities
  (DLNA, DIAL, AirPlay, Chromecast, Roku, webOS, etc.), but with
  modern improvements for iOS developers:

  • Full Swift module support with DEFINES_MODULE  
  • Cleaned prefix header (no deprecated or unused macros)  
  • iOS 11+ compatibility ensured  
  • Original functionality preserved, with simplified integration  

  This fork is designed for developers who want the reliability of
  ConnectSDK combined with a modern Swift-first integration.
  DESC

  s.homepage     = "https://github.com/Farhan-Maqsood/ConnectSDK-Swift"
  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author       = { "Farhan Maqsood" => "youremail@example.com" }
  s.social_media_url = "https://twitter.com/appleAppsArt"

  s.platform     = :ios, "11.0"
  s.ios.deployment_target = "11.0"

  s.source       = { :git => "https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git",
                     :tag => s.version }

  s.module_name  = "ConnectSDK"
  s.pod_target_xcconfig = {
    "DEFINES_MODULE" => "YES",
    "OTHER_LDFLAGS"  => "$(inherited) -ObjC"
  }

  s.requires_arc = true
  s.libraries = "z", "icucore"

  s.prefix_header_contents = <<-PREFIX
    #define CONNECT_SDK_VERSION @"#{s.version}"

    #define CONNECT_SDK_ENABLE_LOG

    #ifndef kConnectSDKWirelessSSIDChanged
    #define kConnectSDKWirelessSSIDChanged @"Connect_SDK_Wireless_SSID_Changed"
    #endif

    #ifdef CONNECT_SDK_ENABLE_LOG
        #ifdef DEBUG
        #   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
        #else
        #   define DLog(...)
        #endif
    #else
        #   define DLog(...)
    #endif
  PREFIX

  s.subspec 'Core' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core'
  end

  # 🔹 Google Cast support
  s.subspec 'GoogleCast' do |sp|
    cast_dir = "modules/google-cast"

    sp.dependency 'ConnectSDK-Swift/Core'
    sp.source_files = "#{cast_dir}/**/*.{h,m}"
    sp.exclude_files = "#{cast_dir}/*Tests/**/*"
    sp.private_header_files = "#{cast_dir}/**/*_Private.h"

    cast_version = "2.7.1"
    sp.dependency "google-cast-sdk", cast_version
    sp.framework = "GoogleCast"
    sp.xcconfig = {
      "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/google-cast-sdk/GoogleCastSDK-#{cast_version}-Release",
    }
  end
end
