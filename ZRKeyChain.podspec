Pod::Spec.new do |spec|
spec.name         = 'ZRKeyChain'
spec.version      = '1.0'
spec.license      = 'MIT'
spec.homepage     = 'https://github.com/VictorZhang2014/ZRKeyChain'
spec.author       = { 'Victor Zhang' => 'victorzhangq@gmail.com' }
spec.summary      = 'A keychain library for storing accounts and passwords and sharing data between multiple applications in Objective-C.'
spec.source       = { :git => 'https://github.com/VictorZhang2014/ZRKeyChain.git', :tag => spec.version }
spec.requires_arc = true
spec.platform = :ios
spec.ios.deployment_target = '7.0'

spec.public_header_files = 'ZRKeyChain/*.{h}'
spec.source_files = 'ZRKeyChain/*.{h,m}'
end
