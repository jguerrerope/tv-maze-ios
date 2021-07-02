import UIKit

extension NextPageViewCell {
    
    private var indicatorSize: CGFloat {
        return 250
    }
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupViewProperties()
    }
    
    private func setupSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(indicatorView)
    }
    
    private func setupConstraints() {
        containerView.anchor(
            top: contentView.topAnchor,
            left: contentView.leftAnchor,
            right: contentView.rightAnchor
        )
        
        let bottomConstraint = containerView.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor
        )
        bottomConstraint.priority = .defaultLow
        bottomConstraint.isActive = true
        
        indicatorView.anchor(
            top: containerView.topAnchor,
            topConstant: SpacingRule.space8,
            heightConstant: 250
        )
        indicatorView.equalWidthToHeight(multiplier: 1.5)
        indicatorView.anchorCenterToView(containerView)
    }
    
    private func setupViewProperties() {
        backgroundColor = AppColor.clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        indicatorView.clipsToBounds = true
    }
}
