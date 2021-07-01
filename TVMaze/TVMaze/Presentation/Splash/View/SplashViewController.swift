import UIKit
import Foundation

class SplashViewController: UIViewController {
 
    let router: SplashRouter
    let viewModel: SplashViewModel
    let iconImageView = UIImageView()

    init(viewModel: SplashViewModel, router: SplashRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print(#function, String(describing: SplashViewController.self))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarStyle()
    }
}
