#
# Be sure to run `pod lib lint AKServiceWithKakaoLocal.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AKServiceWithKakaoLocal'
  s.version          = '0.1.3'
  s.summary          = 'AKService의 위치 관련 데이터를 kakao local rest api를 이용하는 라이브러리입니다.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AKService의 위치 관련 데이터를 kakao local rest api를 이용하는 라이브러리입니다.
예를 들어, TM좌표를 가져올때 airkorea에서 제공하는 현재 동기준의 좌표를 가져오지않고 사용자의 GPS정보를 기반으로 kakao에서 변환하는 TM좌표를 사용합니다.
                       DESC

  s.homepage         = 'https://github.com/ocworld/AKServiceWithKakaoLocal'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Keunhyun Oh' => 'ocworld@gmail.com' }
  s.source           = { :git => 'https://github.com/ocworld/AKServiceWithKakaoLocal.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AKServiceWithKakaoLocal/Sources/**/*'
  
  s.swift_version = '4.1'
  
  # s.resource_bundles = {
  #   'AKServiceWithKakaoLocal' => ['AKServiceWithKakaoLocal/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.dependency 'AKService'
  s.dependency 'OHKakaoLocalSDK'
  
end
