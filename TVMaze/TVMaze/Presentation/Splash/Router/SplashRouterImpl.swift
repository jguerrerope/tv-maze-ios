import Foundation
import UIKit

class SplashRouterImpl {
    private var uiWindowProvider: Provider<UIWindow>
    private let homeViewControllerProvider: Provider<UINavigationController>
    
    init(uiWindowProvider: Provider<UIWindow>,
         homeViewControllerProvider: Provider<UINavigationController>) {
        self.uiWindowProvider = uiWindowProvider
        self.homeViewControllerProvider = homeViewControllerProvider
    }
    
    deinit {
        print(#function, String(describing: SplashRouterImpl.self))
    }
}

extension SplashRouterImpl: SplashRouter {
   
    func goToHome() {
        let viewController = homeViewControllerProvider.instance()
        let uiWindow = uiWindowProvider.instance()
        UIView.transitionTo(uiWindow, viewController, .transitionCrossDissolve)
    }
}
