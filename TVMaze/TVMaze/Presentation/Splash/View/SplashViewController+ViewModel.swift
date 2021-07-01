import UIKit
import Foundation

// ViewModel SetUp
extension SplashViewController {
    
    func setUpViewModel() {
        viewModel.navigate.addAndNotify(self, { [weak self ] _ in
            self?.router.goToHome()
        })
    
        viewModel.setUp()
    }
}

