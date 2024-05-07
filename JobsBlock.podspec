#
# Be sure to run `pod lib lint YMExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'JobsBlock'
  spec.version          = '1.0.0'
  spec.summary          = 'JobsOCBaseConfig.JobsBlock'
  spec.description      = <<-DESC
  所有的项目根据这个根来进行统一配置和调用
  做到全局的一致和统一 
  千万要保证这个工程的编译通过，以后项目直接进行引用
           DESC
  spec.homepage         = 'https://github.com/295060456/JobsBlock'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  # 这里的commit会和Github进行通讯，这里的值不能是自定义。
  # commit 参数用于指定从 Github 存储库中获取代码时要使用的提交哈希值
  # 注意不要包含:commit参数,因为CocoaPods会自动使用最新的commit
  spec.source       = {:git => "git@github.com:295060456/JobsBlock.git",:tag => "#{spec.version}"}
  # spec.source       = {:git => "https://github.com/295060456/JobsBlock.git",:tag => "#{spec.version}"}
  spec.social_media_url = 'https://github.com/295060456'
  spec.ios.deployment_target = '10.0'
  spec.swift_version = '5.0'
  spec.requires_arc = true
  spec.source_files  = '不定参数的Block', '确定参数的Block'
=begin
  spec.pod_target_xcconfig 是用来设置 Pod 本身的编译设置，即 Pod 项目的编译设置。
  在这个例子中，EXCLUDED_ARCHS[sdk=iphonesimulator*] 是 Xcode 中的一个编译设置键，用来排除指定的架构（architectures）在编译时。
  在这里，设置为 'arm64' 表示在模拟器（iOS Simulator）上排除 arm64 架构的编译，通常用于解决一些第三方库或者组件在模拟器上编译报错的问题。
=end
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
=begin
  spec.user_target_xcconfig 是用来设置 Pod 被集成到用户项目中时的编译设置。
  与 spec.pod_target_xcconfig 不同，这个设置影响的是包含了你的 Pod 的用户项目的编译设置。
  同样，EXCLUDED_ARCHS[sdk=iphonesimulator*] 用来排除特定架构的编译，以确保 Pod 能够在用户项目中正确编译和运行。
=end
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
=begin 示例代码：分文件夹存放
  spec.default_subspec = 'Core'
  spec.subspec 'Core' do |core|
    core.source_files = 'ZFPlayer/Classes/Core/**/*'
    core.public_header_files = 'ZFPlayer/Classes/Core/**/*.h'
    core.resource = 'ZFPlayer/Classes/ControlView/ZFPlayer.bundle'
    core.dependency 'ZFPlayer/Core'
    core.frameworks = 'UIKit', 'MediaPlayer', 'AVFoundation'
  end
=end

# 框架依赖的framework
  spec.frameworks   = 'UIKit','Foundation'
# 框架依赖的其他第三方库
# spec.dependency 'SDWebImage' # "~> 1.4"
  
end