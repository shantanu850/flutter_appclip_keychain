import Flutter
import UIKit

public class FlutterAppclipKeychainPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_appclip_keychain", binaryMessenger: registrar.messenger())
    let instance = FlutterAppclipKeychainPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: String],
    let key = args["key"]
    let value = args["value"]
    let suiteName = args["suite_name"]
    if call.method == "write",
        let res = this.write(key,value,suiteName)
        result(res)
    if call.method == "read",
       let res = this.read(key,suiteName)
       result(res)
    if call.method == "uuid",
       let res = this.uuid()
       result(res)
  }

  private func write(key: String,value: String,suiteName: String) -> String? {
    guard let sharedUserDefaults = UserDefaults(suiteName: suiteName) else {}
    sharedUserDefaults.set(value, forKey: key)
  }
  private func read(key: String,suiteName: String) -> String? {
    guard let sharedUserDefaults = UserDefaults(suiteName: suiteName) else {}
    guard let migratedData = sharedUserDefaults.string(forKey: key) else { return }
  }

  private func uuid() -> String {
    if let uuid = UIDevice.current.identifierForVendor?.uuidString {
      print(uuid)
    }
    let identifier = UUID().uuidString
  }
}
