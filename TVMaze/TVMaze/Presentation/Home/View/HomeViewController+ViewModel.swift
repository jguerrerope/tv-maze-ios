import UIKit
import Foundation

extension HomeViewController {
    
    func setupViewModel() {
        viewModel.homeItems.addAndNotify(self, { [weak self] itemsResource in
            switch itemsResource {
            case .loading:
               break
                
            case .success(let items):
                self?.adapter.update(items)
    
            case .fail:
               break
            }
        })
        
        viewModel.navigateToTVShowDetails.addAndNotify(self, { [weak self] tvShow in
            self?.router.goToTVShowDetails(show: tvShow)
        })
        
        viewModel.setUp()
    }
}

