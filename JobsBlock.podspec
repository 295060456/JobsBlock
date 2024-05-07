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
  spec.summary          = 'JobsBlock'
  spec.description      = <<-DESC
  所有的项目根据这个根来进行统一配置和调用
  做到全局的一致和统一 
  千万要保证这个工程的编译通过，以后项目直接进行引用
           DESC
  spec.homepage         = 'https://github.com/295060456/JobsBlock'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  # spec.source           = { :git => 'https://github.com/295060456/JobsBlock.git', :tag => "#{spec.version}" }
  spec.source       = {:git => "https://github.com/295060456/JobsBlock.git",:tag => "#{spec.version}",:commit => "hahah"}
  spec.ios.deployment_target = '10.0'
  spec.swift_version = '5.0'
  spec.requires_arc = true
  spec.source_files  = '不定参数的Block', '确定参数的Block'
# 框架依赖的framework
  spec.frameworks   = 'UIKit','Foundation'
# 框架依赖的其他第三方库
# spec.dependency 'SDWebImage' # "~> 1.4"
  
end
