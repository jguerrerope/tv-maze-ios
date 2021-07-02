import Foundation
import UIKit

class HomeRouterImpl {
    
    private let hostViewControllerProvider: Provider<UINavigationController>
    private let tvShowDetailsViewControllerProvider: Provider<UIViewController>

    init(hostViewControllerProvider: Provider<UINavigationController>,
         tvShowDetailsViewControllerProvider: Provider<UIViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
        self.tvShowDetailsViewControllerProvider = tvShowDetailsViewControllerProvider
    }
}

extension HomeRouterImpl: HomeRouter {
    
    func goToTVShowDetails(show: TVShow) {
        let viewController = tvShowDetailsViewControllerProvider.instance(param: show)
        hostViewControllerProvider.instance().pushViewController(viewController, animated: true)
    }
}
