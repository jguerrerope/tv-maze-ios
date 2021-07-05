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
                
            case .fail(let message):
                self?.adapter.clear()
                self?.showToast(message: message)
            }
        })
        
        viewModel.navigateToTVShowDetails.addAndNotify(self, { [weak self] tvShow in
            self?.router.goToTVShowDetails(show: tvShow)
        })

        viewModel.showEmptyListMessage.addAndNotify(self, { [weak self] show in
            self?.showEmpyListMessage(show: show)
        })
    
        viewModel.setUp()
    }
    
    private func showEmpyListMessage(show: Bool) {
        self.emptyListContainerView.isHidden = !show
    }
    
    private func showToast(message: String) {
        let alert = UIAlertController(title: .none, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        
        present(alert, animated: true)
    
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            alert.dismiss(animated: true)
        }
    }
}

