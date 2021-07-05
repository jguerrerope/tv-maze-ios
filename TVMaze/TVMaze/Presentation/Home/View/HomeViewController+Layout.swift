
import UIKit

extension HomeViewController {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupViewProperties()
        setupTableViewProperties()
        setupEmptyListImageViewProperties()
        setupEmptyListMessageLabelProperties()
        setupEmptyListTryAgainLabelProperties()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        view.addSubview(emptyListContainerView)
        
        emptyListContainerView.addSubview(emptyListImageView)
        emptyListContainerView.addSubview(emptyListMessageLabel)
        emptyListContainerView.addSubview(emptyListTryAgainLabel)
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
        
        emptyListMessageLabel.anchor(
            top: emptyListImageView.bottomAnchor,
            left: emptyListContainerView.leftAnchor,
            right: emptyListContainerView.rightAnchor
        )
        
        emptyListTryAgainLabel.anchor(
            top: emptyListMessageLabel.bottomAnchor,
            left: emptyListContainerView.leftAnchor,
            right: emptyListContainerView.rightAnchor,
            topConstant: SpacingRule.space24,
            heightConstant: SpacingRule.space44
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
        tableView.backgroundColor = AppColor.midnightBlueDark
        
        adapter.delegate = self
    }
    
    private func setupEmptyListImageViewProperties() {
        emptyListImageView.image = UIImage(named: "robotDead")
        emptyListImageView.contentMode = .scaleAspectFit
    }
    
    private func setupEmptyListMessageLabelProperties() {
        emptyListMessageLabel.numberOfLines = 0
        emptyListMessageLabel.textAlignment = .center
        emptyListMessageLabel.textColor = AppColor.sand
        emptyListMessageLabel.font = AppFont.montserratRegularSmall
        emptyListMessageLabel.text = "tv_show_list_empty".localized()
    }
    
    private func setupEmptyListTryAgainLabelProperties() {
        emptyListTryAgainLabel.numberOfLines = 0
        emptyListTryAgainLabel.textAlignment = .center
        emptyListTryAgainLabel.textColor = AppColor.sand
        emptyListTryAgainLabel.font = AppFont.montserratSemiBoldMedium
        emptyListTryAgainLabel.text = "tv_show_list_try_again".localized()
        
        emptyListTryAgainLabel.isUserInteractionEnabled = true
        emptyListTryAgainLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTryAgainTapped)))
    }
}

