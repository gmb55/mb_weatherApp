platform :ios, '11.0'

use_frameworks!

def all_pods

  pod 'R.swift'
  pod 'Moya/RxSwift'
  pod 'RxCocoa'
  pod 'SnapKit'
  pod 'IQKeyboardManagerSwift'

end

target 'mb_weatherApp' do

  all_pods

  target 'mb_weatherAppTests' do
    inherit! :search_paths
    all_pods
  end

  target 'mb_weatherAppUITests' do
    all_pods
  end

end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
               end
          end
   end
end