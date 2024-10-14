import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "com.matrix_app/custom_toast"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("rootViewController is not type FlutterViewController")
    }
    let channel = FlutterMethodChannel(name: CHANNEL,
                                       binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "showToast" {
        if let args = call.arguments as? Dictionary<String, Any>,
           let message = args["message"] as? String {
          self.showToast(message: message)
          result(nil)
        } else {
          result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    })
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func showToast(message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    window?.rootViewController?.present(alert, animated: true, completion: nil)
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      alert.dismiss(animated: true, completion: nil)
    }
  }
}
