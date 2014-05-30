#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "KIF+XBAdditions"
  s.version          = "0.1.4"
  s.summary          = "A small toolset for KIF. With love, from Xebia."
  s.description      = <<-DESC
                        A small toolset for KIF. Adds view retrieval by accessibility hint.
                       DESC
  s.homepage         = "https://github.com/viteinfinite/KIF-XBAdditions"
  s.license          = 'MIT'
  s.author           = { "Simone Civetta" => "viteinfinite@gmail.com" }
  s.source           = { :git => "https://github.com/viteinfinite/KIF-XBAdditions.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/viteinfinite'

  s.platform     = :ios, '5.1'
  s.requires_arc = true

  s.source_files = 'Classes/'

  s.public_header_files = 'Classes/*.h'
  s.dependency 'KIF', '~> 3.0'
end
