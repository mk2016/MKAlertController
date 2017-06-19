Pod::Spec.new do |s|
  s.name              = "MKAlertController"
  s.version           = "1.0.0"
  s.summary           = "UIAlertController category, custom UI."
  s.homepage          = "https://github.com/mk2016/MKAlertController"
  s.license           = "MIT"
  s.author            = { "MK Xiao" => "xiaomk7758@sina.com" }
  s.social_media_url  = "https://mk2016.github.io"
  s.platform          = :ios, "8.0"
  s.source            = { :git => "https://github.com/mk2016/MKAlertController.git", :tag => s.version }
  s.source_files      = "MKAlertController/*.{h,m}"
  s.requires_arc      = true
end
