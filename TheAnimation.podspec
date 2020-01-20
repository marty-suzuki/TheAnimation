#
# Be sure to run `pod lib lint TheAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TheAnimation'
  s.version          = '0.4.0'
  s.summary          = 'Type safe CAAnimation wrapper.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#   s.description      = <<-DESC
# TODO: Add long description of the pod here.
#                         DESC

  s.homepage         = 'https://github.com/marty-suzuki/TheAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'marty-suzuki' => 's1180183@gmail.com' }
  s.source           = { :git => 'https://github.com/marty-suzuki/TheAnimation.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/marty_suzuki'

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'TheAnimation/**/*.{swift}'
end
