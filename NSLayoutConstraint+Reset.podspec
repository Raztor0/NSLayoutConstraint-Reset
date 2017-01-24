#
# Be sure to run `pod lib lint NSLayoutConstraint-Reset.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NSLayoutConstraint+Reset"
  s.version          = "0.1.1"
  s.summary          = "Reset the initial constant value of an NSLayoutConstraint."

  s.description      = <<-DESC
                      When modifying NSLayoutConstraints through code, it is often the case that the constant value is initialized to a particular value, then changed, and later set back to the initial value. Instead of holding on to the initial value of every constraint which you need to modify in this way, NSLayoutConstraint+Reset does the work for you.
                       DESC

  s.homepage         = "https://github.com/Raztor0/NSLayoutConstraint-Reset"
  s.license          = 'MIT'
  s.author           = { "Razvan Bangu" => "razvan.bangu@gmail.com" }
  s.source           = { :git => "https://github.com/Raztor0/NSLayoutConstraint-Reset.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
