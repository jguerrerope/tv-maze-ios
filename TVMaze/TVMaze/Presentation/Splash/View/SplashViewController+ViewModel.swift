import UIKit
import Foundation


extension SplashViewController {
    
    func setupViewModel() {
        viewModel.navigate.addAndNotify(self, { [weak self ] _ in
            self?.router.goToHome()
        })
    
        viewModel.setUp()
    }
}

