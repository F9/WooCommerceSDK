Pod::Spec.new do |s|
  s.name = 'WooCommerceSDK'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'SDK for WooCommerce'
  s.homepage = 'https://woocommerce.com/'
  s.source = { :git => 'https://github.com/F9/WooCommerceSDK.git', :tag => s.version }

  s.author           = { 'F9' => 'francesco.nove@gmail.com' }
  
  s.ios.deployment_target  = '8.0'
  s.osx.deployment_target  = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
  s.source_files = 'Sources/*.swift'
  
  s.dependency 'Alamofire'
  s.dependency 'ObjectMapper'
end
