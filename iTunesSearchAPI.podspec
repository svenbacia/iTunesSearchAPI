Pod::Spec.new do |s|

   s.name    = 'iTunesSearchAPI'
   s.version = '0.4.1'
   s.license = 'MIT'

   s.summary          = 'Simple iTunes Search API wrapper'
   s.homepage         = 'https://github.com/svenbacia/iTunesSearchAPI'
   s.social_media_url = 'https://twitter.com/svenbacia'
   s.author           = 'Sven Bacia'

   s.source = { :git => 'https://github.com/svenbacia/iTunesSearchAPI.git', :tag => s.version }
   s.source_files = 'Source/*.swift'

   s.ios.deployment_target     = '8.4'
   s.osx.deployment_target     = '10.10'
   s.tvos.deployment_target    = '9.0'
   s.watchos.deployment_target = '2.0'

   s.requires_arc = true
end
