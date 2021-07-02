import Foundation
import UIKit

public class HomeProvider: ComponentFactoryProvider<UINavigationController> {
    
    init() {
        super.init(type: .weak)
    }
    
    public override func internalFactory() -> UINavigationController {
        let router = provideRouter()
        let viewModel = provideViewModel()
        let viewController = HomeViewController(viewModel: viewModel, router: router)
        
        return UINavigationController(rootViewController: viewController)
    }
    
    private func provideRouter() -> HomeRouter {
        return HomeRouterImpl(
            hostViewControllerProvider: PresentationAssemblyModule.homeProvider,
            tvShowDetailsViewControllerProvider: PresentationAssemblyModule.tvShowDetailsProvider
        )
    }
    
    private func provideViewModel() -> HomeViewModel {
        return HomeViewModel(
            getTVShowsUseCase: DomainAssemblyModule.getTVShowsUseCase.instance()
        )
    }
}
