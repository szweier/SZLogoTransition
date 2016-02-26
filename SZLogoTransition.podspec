Pod::Spec.new do |s|
  s.name             = "SZLogoTransition"
  s.version          = "0.0.1"
  s.summary          = "Transition that spins the views with a logo overlaying and zooming in and out"
  s.description      = "Transition that spins the views with a logo overlaying while zooming in and out."
  s.homepage         = "http://www.stevenzweier.com"
  s.license          = 'MIT'
  s.author           = { "Steven Zweier" => "steve.zweier+opensource@gmail.com" }
  s.source           = { :git => "https://github.com/szweier/SZLogoTransition.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'SZLogoTransition/Animator/**/*'
end
