
import UIKit

extension HomeViewController {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupViewProperties()
        setupTableViewProperties()
        setupEmptyListImageViewProperties()
        setupEmptyListMessageProperties()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        view.addSubview(emptyListContainerView)
        
        emptyListContainerView.addSubview(emptyListImageView)
        emptyListContainerView.addSubview(emptyListMessage)
    }
    
    private func setupConstraints() {
        tableView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
        
        emptyListContainerView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
    
        emptyListImageView.anchor(
            width: view.widthAnchor,
            widthMultiplier: 0.6
        )
        emptyListImageView.equalHeightToWidth(multiplier: 0.8)
        emptyListImageView.anchorCenterToView(emptyListContainerView)
        
        emptyListMessage.anchor(
            top: emptyListImageView.bottomAnchor,
            left: emptyListContainerView.leftAnchor,
            right: emptyListContainerView.rightAnchor
        )
    }
    
    // MARK: SetUp View Properties
    private func setupViewProperties() {
        title = "app_name".localized()
        view.backgroundColor = AppColor.midnightBlueDark
    }

    private func setupTableViewProperties() {
        tableView.bounces = true
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 300
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: SpacingRule.space28))
        
        adapter.delegate = self
    }
    
    private func setupEmptyListImageViewProperties() {
        emptyListImageView.image = UIImage(named: "robotDead")
        emptyListImageView.contentMode = .scaleAspectFit
    }
    
    private func setupEmptyListMessageProperties() {
        emptyListMessage.numberOfLines = 0
        emptyListMessage.textAlignment = .center
        emptyListMessage.textColor = AppColor.sand
        emptyListMessage.font = AppFont.montserratRegularSmall
        emptyListMessage.text = "tv_show_list_empty".localized()
    }
}

