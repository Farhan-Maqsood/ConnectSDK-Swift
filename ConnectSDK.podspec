Pod::Spec.new do |s|
  s.name         = "ConnectSDK-Swift"
  s.version      = "1.0.1"
  s.summary      = "ConnectSDK Swift SDK"
  s.description  = <<-DESC
    ConnectSDK Swift module for device discovery and communication.

    Handles high-level services, framework integration, and GoogleCast support.
  DESC

  s.homepage     = "https://github.com/Farhan-Maqsood/ConnectSDK-Swift"
  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author       = { "Farhan Maqsood" => "youremail@example.com" }

  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git",
                     :tag => s.version }

  s.requires_arc = true
  s.module_name  = "ConnectSDK"

  s.pod_target_xcconfig = {
    "DEFINES_MODULE" => "YES",
    "OTHER_LDFLAGS"  => "$(inherited) -ObjC"
  }

  # Source files (based on your repo)
  # Core source files
  s.source_files = "core/**/*.{h,m}",
                   "modules/**/*.{h,m}",
                   "ConnectSDKDefaultPlatforms.h",
                   "ConnectSDK.h"

  # Private headers
  s.private_header_files = "**/*_Private.h"

  # Module map for Swift import
  s.module_map = "modules/module.modulemap"

  # System libraries/frameworks
  s.libraries  = "z", "icucore"
  s.frameworks = "SystemConfiguration", "CoreBluetooth"

  # Prefix header definitions
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

  # Core subspec
  s.subspec 'Core' do |sp|
    sp.dependency 'ConnectSDK-Swift-Core', '1.0.1'
  end

  # GoogleCast subspec
  s.subspec 'GoogleCast' do |sp|
    cast_dir = "modules/google-cast"

    sp.dependency 'ConnectSDK-Swift-Core', '1.0.1'
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

