import Foundation
import UIKit

public class SplashProvider: ComponentFactoryProvider<UINavigationController> {
    
    init() {
        super.init(type: .weak)
    }
    
    public override func internalFactory() -> UINavigationController {
        let router = provideRouter()
        let viewModel = provideViewModel()
        let viewController = SplashViewController(viewModel: viewModel, router: router)
        
        return UINavigationController(rootViewController: viewController)
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
