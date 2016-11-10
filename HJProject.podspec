

Pod::Spec.new do |s|

  s.name         = "HJProject"
  s.version      = "0.0.2"
  s.summary      = "HJProject"
  s.description  = <<-DESC
                      Podspec test 
                   DESC
  s.homepage     = "https://github.com/CoderGiaJiang/HJProject"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "GiaJiang" => "513871674@qq.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/CoderGiaJiang/HJProject.git", :tag => "0.0.2" }
  s.prefix_header_file = 'HJProject/PrefixHeader.pch'
  s.public_header_files = 'HJProject/**/*.h'
  s.source_files  = "HJProject/**/*.{h,m}";"Pods/*"
  s.dependency 'MJRefresh'
  s.dependency 'Masonry'

end
