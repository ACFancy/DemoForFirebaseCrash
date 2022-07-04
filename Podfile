platform :ios, '16.0'

use_frameworks!
inhibit_all_warnings!

target 'DemoForPaste' do
    pod 'Firebase/Core', '~> 9.2.0'
    pod 'Firebase/Crashlytics', '~> 9.2.0'
    pod 'Firebase/Analytics', '~> 9.2.0'
    pod 'Firebase/Auth', '~> 9.2.0'
    pod 'Firebase/RemoteConfig', '~> 9.2.0'
    pod 'Firebase/Performance', '~> 9.2.0'
    pod 'Firebase/Database', '~> 9.2.0'
    pod 'Firebase/DynamicLinks', '~> 9.2.0'
end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      if config.name == "Debug"
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      end
    end
end