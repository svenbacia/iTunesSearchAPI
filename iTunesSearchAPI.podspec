Pod::Spec.new do |s|

   s.name          = 'iTunesSearchAPI'
   s.version       = '1.0'
   s.license       = 'MIT'
   s.swift_version = '5.0'

   s.summary          = 'Simple iTunes Search API wrapper'
   s.homepage         = 'https://github.com/svenbacia/iTunesSearchAPI'
   s.social_media_url = 'https://twitter.com/svenbacia'
   s.author           = 'Sven Bacia'

   s.source = { :git => 'https://github.com/svenbacia/iTunesSearchAPI.git', :tag => s.version }
   s.source_files = 'Sources/**/*.swift'

   s.ios.deployment_target     = '8.4'
   s.tvos.deployment_target    = '9.0'

   s.requires_arc = true
end
