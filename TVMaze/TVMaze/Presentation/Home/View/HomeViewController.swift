import UIKit

class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    let router: HomeRouter
    
    let tableView: UITableView
   
    let emptyListContainerView: UIView
    let emptyListImageView: UIImageView
    let emptyListMessageLabel: UILabel
    let emptyListTryAgainLabel: UILabel
    let adapter: HomeTableViewAdapter
    
    public init(viewModel: HomeViewModel, router: HomeRouter) {
        self.tableView = UITableView()
        self.emptyListContainerView = UIView()
        self.emptyListImageView = UIImageView()
        self.emptyListMessageLabel = UILabel()
        self.emptyListTryAgainLabel = UILabel()
        
        self.adapter = HomeTableViewAdapter(tableView: tableView)
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print(#function, String(describing: HomeViewController.self))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupAccessibilityIdentifier()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarStyle()
    }
    
    @objc
    func onTryAgainTapped(_ sender: UITapGestureRecognizer? = nil) {
        viewModel.setUp()
    }
    
    private func setupAccessibilityIdentifier() {
        #if DEBUG
        view.accessibilityIdentifier = "HomeScreen"
        #endif
    }
}

extension HomeViewController: HomeTableViewAdapterDelegate {
    
    func onTVShowTapped(id: String) {
        viewModel.onTVShowselected(id: id)
    }
    
    func onNextPageReached(id: String) {
        viewModel.loadNextPage(from: id)
    }
}
