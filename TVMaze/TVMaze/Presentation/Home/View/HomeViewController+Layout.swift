
import UIKit

extension HomeViewController {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupViewProperties()
        setupTableViewProperties()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
    }
    
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
}

