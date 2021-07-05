import UIKit

extension TVShowViewCell {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupViewProperties()
        setupTitleLabelProperties()
    }
    
    private func setupSubviews() {
        contentView.addSubview(containerView)

        containerView.addSubview(shadowImageView)
        containerView.addSubview(titleLabel)
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
       
        shadowImageView.anchor(
            top: containerView.topAnchor,
            topConstant: SpacingRule.space8,
            width: contentView.widthAnchor,
            widthMultiplier: 0.9
        )
        shadowImageView.equalHeightToWidth(multiplier: 0.6)
        shadowImageView.anchorCenterToView(containerView)
        
        titleLabel.anchor(
            left: shadowImageView.leftAnchor,
            bottom: shadowImageView.bottomAnchor,
            right: shadowImageView.rightAnchor,
            leftConstant: SpacingRule.space20,
            bottomConstant: SpacingRule.space8,
            rightConstant: SpacingRule.space20
        )
    }
    
    private func setupViewProperties() {
        backgroundColor = AppColor.clear
        containerView.backgroundColor = AppColor.clear
    }

    private func setupTitleLabelProperties() {
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = AppColor.white
        titleLabel.font = AppFont.montserratBoldExtraLarge
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        shadowImageView.imageUrl = .none
        titleLabel.text = ""
    }
}
