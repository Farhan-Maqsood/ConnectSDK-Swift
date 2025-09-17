Pod::Spec.new do |s|
  s.name             = 'ConnectSDK-Swift'
  s.version          = '1.0.1'
  s.summary          = 'Connect SDK Swift version'
  s.description      = <<-DESC
  ConnectSDK-Swift enables discovery and connection to multiple devices 
  such as FireTV, Google Cast, and more.
  DESC

  s.homepage         = 'https://github.com/yourusername/ConnectSDK-Swift'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'you@example.com' }
  s.source           = { :git => 'https://github.com/yourusername/ConnectSDK-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version    = '5.0'

  # Include everything (core + modules + default platforms header)
  s.source_files = 'core/**/*.{h,m,swift}', 'modules/**/*.{h,m,swift}', 'ConnectSDKDefaultPlatforms.h'
  s.public_header_files = 'core/**/*.h', 'modules/**/*.h', 'ConnectSDKDefaultPlatforms.h'
end

