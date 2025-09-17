Pod::Spec.new do |s|
  s.name             = 'ConnectSDK-Swift'
  s.version          = '1.0.1'
  s.summary          = 'Connect SDK Swift version'
  s.description      = <<-DESC
  ConnectSDK-Swift enables discovery and connection to multiple devices 
  such as FireTV, Google Cast, and more.
  DESC

  s.homepage         = 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Farhan Maqsood' => 'farhanmaqsood44@gmail.com' }
  s.source           = { :git => 'https://github.com/Farhan-Maqsood/ConnectSDK-Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version    = '5.0'

  # Important: force module name to "ConnectSDK"
  s.module_name      = 'ConnectSDK'

  # Include all sources
  s.source_files = 'ConnectSDK-Swift/**/*.{h,m,swift}'
  s.public_header_files = 'ConnectSDK-Swift/**/*.h'

  # Depend on the Core pod
  s.dependency 'ConnectSDK-Swift-Core', '~> 1.0.2'
end

