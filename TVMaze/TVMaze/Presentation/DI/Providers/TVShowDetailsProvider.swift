import Foundation
import UIKit

public class TVShowDetailsProvider: ComponentFactoryProvider1<UIViewController, TVShow> {
    
    init() {
        super.init(type: .weak)
    }
    
    public override func internalFactory(param: TVShow) -> UIViewController {
        let router = provideRouter()
        let viewModel = provideViewModel(param)
        let viewController = TVShowDetailsViewController(viewModel: viewModel, router: router)
        
        return viewController
    }

    private func provideRouter() -> TVShowDetailsRouter {
        return TVShowDetailsRouterImpl(
            hostViewControllerProvider: PresentationAssemblyModule.tvShowDetailsProvider
        )
    }
    
    private func provideViewModel(_ tvShow: TVShow) -> TVShowDetailsViewModel {
        return TVShowDetailsViewModel(
            tvShow: tvShow
        )
    }
}
