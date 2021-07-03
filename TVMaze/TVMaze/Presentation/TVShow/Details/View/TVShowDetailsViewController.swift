import UIKit

class TVShowDetailsViewController: UIViewController {
    let viewModel: TVShowDetailsViewModel
    let router: TVShowDetailsRouter
    
    let scrollView: UIScrollView
    let containerView: UIView
    let imageView: UIImageView
    
    let typeTitleSubtitleView: TitleSubtitleView
    let languageTitleSubtitleView: TitleSubtitleView
    let genreTitleSubtitleView: TitleSubtitleView
    let ratingTitleSubtitleView: TitleSubtitleView
    
    let summaryTitleLabel: UILabel
    let summaryLabel: UILabel
    
    public init(viewModel: TVShowDetailsViewModel, router: TVShowDetailsRouter) {
        self.scrollView = UIScrollView()
        self.imageView = UIImageView()
        self.containerView = UIView()
        self.typeTitleSubtitleView = TitleSubtitleView()
        self.languageTitleSubtitleView = TitleSubtitleView()
        self.genreTitleSubtitleView = TitleSubtitleView()
        self.ratingTitleSubtitleView = TitleSubtitleView()
        
        self.summaryLabel = UILabel()
        self.summaryTitleLabel = UILabel()

        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print(#function, String(describing: TVShowDetailsViewController.self))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupAccessibilityIdentifier()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarStyle(prefersLargeTitles: true)
    }
    
    private func setupAccessibilityIdentifier() {
        #if DEBUG
        view.accessibilityIdentifier = "TVShowDetailsScreen"
        #endif
    }
}
