$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.identifier = "com.example.app"
  app.name = 'Example App'

  app.development do
    app.codesign_certificate = "iPhone Developer: John Smith (X123XXX1XX)"
    app.provisioning_profile = '/Users/<whoami>/Library/MobileDevice/Provisioning Profiles/12345678-1234-1234-1234-123456789012.mobileprovision'
  end
  app.release do
    app.deployment_target = '5.1'
    # This is the prefix you see when provisioning you app "XXXXXXXX.com.example.app"
    app.seed_id              = 'XXXXXXXXX'
    app.codesign_certificate = "iPhone Distribution: John Smith"
    app.provisioning_profile = '/Users/<whoami>/Library/MobileDevice/Provisioning Profiles/12345678-1234-1234-1234-123456789012.mobileprovision'
  end

  # app.icons = ['Logo.png', 'Logo@2x.png']

  app.interface_orientations = [:portrait]

  app.frameworks += ["OpenGLES", "OpenAL", "AVFoundation", "QuartzCore", "AudioToolbox", "MessageUI", "SystemConfiguration"]

  # Admob
  app.vendor_project('vendor/GoogleAdMobAdsSDK', :static)

  # BubbleWrap
  app.files += Dir.glob(File.join(app.project_dir, 'vendor/BubbleWrap/lib/**/*.rb'))

  # HTML Parsing
  app.files += Dir.glob(File.join(app.project_dir, 'vendor/hpple-motion/lib/*.rb'))
  app.vendor_project('vendor/hpple-motion/vendor/hpple', :static)

  # Linkage
  app.libs << "/usr/lib/libz.dylib"
  app.libs << "/usr/lib/libxml2.2.dylib"

end
