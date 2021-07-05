import Foundation
import UIKit

class TVShowDetailsRouterImpl {
    
    private let hostViewControllerProvider: Provider<UIViewController>

    init(hostViewControllerProvider: Provider<UIViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
    }
    
    deinit {
        print(#function, String(describing: TVShowDetailsRouterImpl.self))
    }
}

extension TVShowDetailsRouterImpl: TVShowDetailsRouter {
    
}
