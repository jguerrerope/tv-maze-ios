import Foundation
import UIKit

class HomeRouterImpl {
    
    private let hostViewControllerProvider: Provider<UINavigationController>

    init(hostViewControllerProvider: Provider<UINavigationController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
    }
}

extension HomeRouterImpl: HomeRouter {
    
}
