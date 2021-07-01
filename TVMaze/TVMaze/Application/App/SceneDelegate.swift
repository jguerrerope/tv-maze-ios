import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    internal var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            self.window = PresentationAssemblyModule.windowProvider.instance(param: windowScene)
            
          
            window?.rootViewController = PresentationAssemblyModule.rootViewController.instance()
            window?.makeKeyAndVisible()
        }
    }
}

