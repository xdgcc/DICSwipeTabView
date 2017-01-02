platform :ios, '8.1'
inhibit_all_warnings!
use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

plugin 'cocoapods-amimono'


def post_install_task
  post_install do |installer|
   puts("Update debug pod settings to speed up build time")
   Dir.glob(File.join("Pods", "**", "Pods*{debug,Private}.xcconfig")).each do |file|
     File.open(file, 'a') { |f| f.puts "\nDEBUG_INFORMATION_FORMAT = dwarf" }
   end

    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
      end
    require 'cocoapods-amimono/patcher'
    Amimono::Patcher.patch!(installer)
 end
end

target 'DICSwipeTabView' do
    pod 'PureLayout', '2.0.6'
end

post_install_task
