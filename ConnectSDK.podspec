Pod::Spec.new do |s|
  s.name         = "ConnectSDK-Swift"
  s.version      = "1.0.1"
  s.summary      = "ConnectSDK Swift SDK"
  s.description  = <<-DESC
    ConnectSDK Swift module for device discovery and communication.
    Handles high-level services and framework integration.
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
  s.source_files = "core/**/*.{h,m}",
                   "modules/**/*.{h,m}",
                   "ConnectSDKDefaultPlatforms.h",
                   "ConnectSDK.h"

  # Private headers
  s.private_header_files = "**/*_Private.h"

  # Module map for Swift
  s.module_map = "modules/module.modulemap" # make sure modulemap exists here

  # System libraries/frameworks
  s.libraries = "z", "icucore"
  s.frameworks = "SystemConfiguration", "CoreBluetooth"
end

