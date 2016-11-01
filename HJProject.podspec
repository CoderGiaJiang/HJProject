

Pod::Spec.new do |s|

  s.name         = "HJProject"
  s.version      = "0.0.1"
  s.summary      = "HJProject"
  s.description  = <<-DESC
                      Podspec test 
                   DESC

  s.homepage     = "https://github.com/CoderGiaJiang/HJProject"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "GiaJiang" => "513871674@qq.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/CoderGiaJiang/HJProject.git", :tag => "0.0.2" , :commit => "ac368de5c61b5e550e41dfa4d07968ab4bce7fd6" }
  s.public_header_files = 'HJProject/**/*.h'
  s.source_files  = "HJProject/**/*.{h,m}"
  s.requires_arc = true

end
