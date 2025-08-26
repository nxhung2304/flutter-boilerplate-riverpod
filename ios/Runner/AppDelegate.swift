import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    private var methodChannel: FlutterMethodChannel?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let registrar = self.registrar(forPlugin: "AppLifecycleManager")!
        methodChannel = FlutterMethodChannel(
            name: "app_lifecycle_manager",
            binaryMessenger: registrar.messenger()
        )

        registerForAppLifecycleNotifications()

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func registerForAppLifecycleNotifications() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(
            self,
            selector: #selector(appDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(appDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(appWillTerminate),
            name: UIApplication.willTerminateNotification,
            object: nil
        )
    }

    @objc private func appDidBecomeActive() {
        methodChannel?.invokeMethod("onForeground", arguments: nil) { result in
        }
    }

    @objc private func appDidEnterBackground() {
        methodChannel?.invokeMethod("onBackground", arguments: nil) { result in
        }
    }

    @objc private func appWillTerminate() {
        methodChannel?.invokeMethod("onBeforeKill", arguments: nil) { result in
        }
    }
}
