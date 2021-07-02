import Foundation
import UIKit

class TVShowDetailsRouterImpl {
    
    private let hostViewControllerProvider: Provider<UIViewController>

    init(hostViewControllerProvider: Provider<UIViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
    }
}

extension TVShowDetailsRouterImpl: TVShowDetailsRouter {
    
}
