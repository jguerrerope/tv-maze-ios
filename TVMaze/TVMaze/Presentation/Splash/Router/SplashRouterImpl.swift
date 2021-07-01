import Foundation
import UIKit

public class SplashRouterImpl: SplashRouter {
    private var uiWindowProvider: Provider<UIWindow>
    private let homeViewControllerProvider: Provider<UINavigationController>
    private static let animation: UIView.AnimationOptions = .transitionCrossDissolve
    
    public init(uiWindowProvider: Provider<UIWindow>,
         homeViewControllerProvider: Provider<UINavigationController>) {
        self.uiWindowProvider = uiWindowProvider
        self.homeViewControllerProvider = homeViewControllerProvider
    }
    
    public func goToHome() {
        let viewController = homeViewControllerProvider.instance()
        let uiWindow = uiWindowProvider.instance()
        UIView.transitionTo(uiWindow, viewController, .transitionCrossDissolve)
    }
}
