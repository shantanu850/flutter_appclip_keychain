#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_appclip_keychain.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_appclip_keychain'
  s.version          = '0.0.1'
  s.summary          = 'ERK Labs'
  s.description      = 'Environmental Research and Kinetics Laboratory'
  s.homepage         = 'http://erklabs.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ERK Labs' => 'shantanu@erklabs.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
