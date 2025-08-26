import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate { 
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     let registrar = self.registrar(forPlugin: "LifecyclePlugin")!
    LifecyclePlugin.register(with: registrar) 
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }    
}
