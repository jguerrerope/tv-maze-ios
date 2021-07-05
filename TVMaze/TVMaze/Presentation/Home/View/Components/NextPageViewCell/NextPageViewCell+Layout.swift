import UIKit

extension NextPageViewCell {
    
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
        containerView.fillView(contentView)
        
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
