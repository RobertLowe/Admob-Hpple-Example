class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = GoogleResultsController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
  
  def application(application, didReceiveMemoryWarning:launchOptions)
    super
  end
end
