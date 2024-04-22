import Flutter
import PhotosUI
import UIKit

public class DismissOpenViewControllersPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "dismiss_open_view_controllers", binaryMessenger: registrar.messenger())
        let instance = DismissOpenViewControllersPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? Dictionary<String, Any> else {
            result(FlutterError(code: "InvalidArgsType", message: "Invalid args type", details: nil))
            return
        }
        switch call.method {
        case "dismiss":
            let animated = args["isAnimated"] as! Bool
            let handlePHPickerViewController = args["handlePHPickerViewController"] as? Bool ?? false
            
            let rvc = UIApplication.shared.findKeyWindow()?.rootViewController
            if #available(iOS 14, *) {
                if handlePHPickerViewController, let pickerViewController = rvc?.presentedViewController as? PHPickerViewController {
                    weak var delegate = pickerViewController.delegate
                    delegate?.picker(pickerViewController, didFinishPicking: [])
                }
            }
            
            rvc?.dismiss(animated: animated, completion: nil)
            
            result(nil)
            break
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

extension UIApplication {
    func findKeyWindow() -> UIWindow? {
        if #available(iOS 15.0, *) {
            return UIApplication
                .shared
                .connectedScenes
                .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                .last
        } else if #available(iOS 13.0, *) {
            return UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .last { $0.isKeyWindow }
        } else {
            return UIApplication.shared.windows.last { $0.isKeyWindow }
        }
    }
}
