

Pod::Spec.new do |s|

  s.name         = "HJProject"
  s.version      = "0.0.1"
  s.summary      = "HJProject"
  s.description  = <<-DESC
                      Podspec test 
                   DESC
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0' 
  s.homepage     = "https://github.com/CoderGiaJiang/HJProject"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "GiaJiang" => "513871674@qq.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/CoderGiaJiang/HJProject.git", :tag => "0.0.1" }
  s.prefix_header_file = 'HJProject/PrefixHeader.pch'
  s.source_files  = "HJProject/**/*.{h,m}";"Pods/"
  s.dependency "Masonry"
  s.dependency "MJRefresh"
  s.requires_arc = true

end
