#
# Be sure to run `pod lib lint KLCache.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KLCache'
  s.version          = '1.0.1'
  s.summary          = '数据缓存组件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  组件简介：
  用于缓存常用数据的缓存；
                       DESC

  s.homepage         = 'https://github.com/Kalanhall'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kalan' => 'Kalanhall@163.com' }
  s.source           = { :git => 'https://github.com/Kalanhall/KLCache.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'KLCache/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KLCache' => ['KLCache/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.libraries = 'sqlite3'
  s.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore'
  # s.dependency 'AFNetworking', '~> 2.3'
end
