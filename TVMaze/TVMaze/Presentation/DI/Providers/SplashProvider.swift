import Foundation
import UIKit

public class SplashProvider: Provider<UINavigationController> {
    
    public override func instance() -> UINavigationController {
        let router = provideRouter()
        let viewModel = provideViewModel()
        
        return UINavigationController(rootViewController: SplashViewController(viewModel: viewModel, router: router))
    }
    
    private func provideRouter() -> SplashRouter {
        return SplashRouterImpl(
            uiWindowProvider: PresentationAssemblyModule.windowProvider,
            homeViewControllerProvider: PresentationAssemblyModule.homeProvider
        )
    }
    
    private func provideViewModel() -> SplashViewModel {
        return SplashViewModel(dispacherHelper: HelperAssemblyModule.dispacherHelperProvider.instance())
    }
}
