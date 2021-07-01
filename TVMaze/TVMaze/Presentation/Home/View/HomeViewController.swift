import UIKit

class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    let router: HomeRouter
    
    let tableView: UITableView
    let adapter: HomeCollectionViewAdapter
    
    public init(viewModel: HomeViewModel, router: HomeRouter) {
        self.tableView = UITableView()
        self.adapter = HomeCollectionViewAdapter(tableView: tableView)
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
}

extension HomeViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarStyle(prefersLargeTitles: true)
    }
}

extension HomeViewController: HomeCollectionViewAdapterDelegate {
    
}
