Pod::Spec.new do |s|
  s.name = 'StomtSDK'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'The new feedback standard.'
  s.homepage = 'https://stomt.com'
  s.social_media_url = 'http://twitter.com/stomt'
  s.authors = { 'Leonardo Cascianelli' => 'h3xept@gmail.com' }
  s.source = { :git => 'https://github.com/stomt/stomt-swift-sdk.git', :tag => s.version }

  s.ios.deployment_target = '10.0'
  s.source_files = 'Source/*.swift'
end