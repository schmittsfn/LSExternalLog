#
# Be sure to run `pod lib lint rediskit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LSExternalLog"
  s.version          = "0.0.4"
  s.summary          = "RedisKit is a asynchronious client framework for Redis server, written in Objective-C."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = "RedisKit is a asynchronious client framework for Redis server, written in Objective-C.

                        It is based on the Hiredis library.
                        It provides asynchronious API using PromiseKit framework.
                        It comes with a comprehensive test suit modeled after Redis commands list."

  s.homepage         = "https://github.com/sts2055/LSExternalLog"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Stefan Schmitt" => "sschmitt@molotov.tv" }
  s.source           = { :git => "git@github.com:sts2055/LSExternalLog.git", :tag => "v#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Hiredis/**/*.{h,c}', 'PromiseKit/**/*.{h,m}', 'RedisKit/**/*.{h,m}', 'LSExternalLog/**/*.{h,m}'
  # s.resource_bundles = {
  #   'rediskit' => ['Pod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
