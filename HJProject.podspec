

Pod::Spec.new do |s|

  s.name         = "HJProject"
  s.version      = "0.0.5"
  s.platform 	 = :ios, '7.0'
  s.summary      = "HJProject"
  s.description  = <<-DESC
                      Podspec test 
                   DESC
  s.homepage     = "https://github.com/CoderGiaJiang/HJProject"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "GiaJiang" => "513871674@qq.com" }
  s.source       = { :git => "https://github.com/CoderGiaJiang/HJProject.git", :tag => "0.0.5" }
  s.requires_arc = true
  s.public_header_files = "HJProject/H(头文件)/*.h","HJProject/Popular Functions(常用功能)/**/*.h","HJProject/Tools(工具类)/**/*.h","HJProject/BaseClass(基类)/*.h","HJProject/Category(类目)/**/*.h"
  s.source_files  = "HJProject/BaseClass(基类)/*","HJProject/Category(类目)/**/*","HJProject/H(头文件)/*","HJProject/Popular Functions(常用功能)/**/*","HJProject/Tools(工具类)/**/*","Pods/*"
  s.prefix_header_file = 'HJProject/PrefixHeader.pch'

  s.dependency 'MJRefresh'
  s.dependency 'Masonry'

end
