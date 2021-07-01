import UIKit
import Foundation

public class SplashViewController: UIViewController {
 
    let router: SplashRouter
    let viewModel: SplashViewModel
    let iconImageView = UIImageView()

    public init(viewModel: SplashViewModel, router: SplashRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUpUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        setUpViewModel()
        self.navigationController?.isNavigationBarHidden = true
    }
}
