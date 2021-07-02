import Foundation
import UIKit

@testable import TVMaze

class TestingRootViewController: UIViewController {
    
    override func loadView() {
        let label = UILabel()
        label.text = "Running Unit Tests..."
        label.textAlignment = .center
        label.textColor = .white
        view = label
    }
}

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate, UIWindowSceneDelegate {
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config =  UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        config.delegateClass = TestingSceneDelegate.self
        return config
    }
}
