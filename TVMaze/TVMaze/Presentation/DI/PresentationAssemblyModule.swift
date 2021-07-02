import Foundation
import UIKit

public class PresentationAssemblyModule {
    
    public static var rootViewController: Provider<UINavigationController> {
        get {
            return self.splashProvider
        }
    }
    
    public static let windowProvider: Provider<UIWindow> = FactoryProvider1<UIWindow, UIWindowScene>(type: .singleton) { windowScene in
        return UIWindow(windowScene: windowScene)
    }
    
    // Mark: Feature Providers
    public static let splashProvider: Provider<UINavigationController> = SplashProvider()
    public static let homeProvider: Provider<UINavigationController> = HomeProvider()
    public static let tvShowDetailsProvider: Provider<UIViewController> = TVShowDetailsProvider()
     
}
