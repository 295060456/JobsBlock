Pod::Spec.new do |spec|
  spec.name         = "JobsBlock"
  spec.version      = "1.0.0"
  spec.summary      = "基础的配置.全局Block的声明"
  spec.description  = "所有的项目根据这个根来进行统一配置和调用"
  spec.homepage     = "https://github.com/295060456/JobsBlock"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Jobs" => "lg295060456@gmail.com" }
  spec.social_media_url   = "https://github.com/295060456"
  spec.platform     = :ios, "7.0"
  spec.ios.deployment_target = "10.0"
  spec.source = { :git => "https://github.com/295060456/JobsBlock.git", :tag => "#{spec.version}", :commit => "Jobs第一次推送" }
  spec.source_files  = "Block1", "Block2"
  spec.frameworks = "UIKit", "Foundation"
  spec.requires_arc = true

end
