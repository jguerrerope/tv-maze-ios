import UIKit

extension TVShowViewCell {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupViewProperties()
        setupdarkAlphaViewProperties()
        setupShowImageViewProperties()
        setupTitleLabelProperties()
        
        //        #if TEST_E2E
        //        setupAccessibilityIdentifier()
        //        #endif
    }
    
    private func setupAccessibilityIdentifier() {
        titleLabel.accessibilityIdentifier = "tv_show_label"
        showImageView.accessibilityIdentifier = "tv_show_image_view"
    }
    
    private func setupSubviews() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(showImageView)
        containerView.addSubview(darkAlphaView)
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
        
        showImageView.anchor(
            top: containerView.topAnchor,
            topConstant: SpacingRule.space8,
            heightConstant: 250
        )
        showImageView.equalWidthToHeight(multiplier: 1.5)
        showImageView.anchorCenterToView(containerView)

        darkAlphaView.anchor(
            top: showImageView.topAnchor,
            left: showImageView.leftAnchor,
            bottom: showImageView.bottomAnchor,
            right: showImageView.rightAnchor
        )
        
        titleLabel.anchor(
            left: showImageView.leftAnchor,
            bottom: showImageView.bottomAnchor,
            right: showImageView.rightAnchor,
            leftConstant: SpacingRule.space20,
            bottomConstant: SpacingRule.space8,
            rightConstant: SpacingRule.space20
        )
    }
    
    private func setupViewProperties() {
        backgroundColor = AppColor.clear
        containerView.backgroundColor = AppColor.clear
    }
    
    private func setupdarkAlphaViewProperties() {
        darkAlphaView.backgroundColor = AppColor.blackAlpha35
    }
    
    private func setupShowImageViewProperties() {
        showImageView.contentMode = .scaleAspectFill
        showImageView.clipsToBounds = true
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
        showImageView.image = nil
        titleLabel.text = ""
       
        accessibilityIdentifier = nil
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        showImageView.roundAllCorners(radius: SpacingRule.space8)
        darkAlphaView.roundAllCorners(radius: SpacingRule.space8)
    }
}
