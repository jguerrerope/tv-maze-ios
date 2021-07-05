
import UIKit

extension TVShowDetailsViewController {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupViewProperties()
        setupImageViewProperties()
        setupScrollViewProperties()
        setupSummaryLabelProperties()
        setupSummaryTitleLabelProperties()
        setupTitleDetails()
    }
    
    private func setupSubviews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        scrollView.addSubview(imageView)
        
        containerView.addSubview(typeTitleSubtitleView)
        containerView.addSubview(languageTitleSubtitleView)
        containerView.addSubview(genreTitleSubtitleView)
        containerView.addSubview(ratingTitleSubtitleView)
        
        containerView.addSubview(summaryLabel)
        containerView.addSubview(summaryTitleLabel)
    }
    
    private func setupConstraints() {
        scrollView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            width: view.widthAnchor
        )
        
        containerView.anchor(
            top: scrollView.topAnchor,
            left: view.leftAnchor,
            bottom: scrollView.bottomAnchor,
            right: view.rightAnchor
        )
        
        imageView.anchor(
            top: containerView.topAnchor,
            left: containerView.leftAnchor,
            right: containerView.rightAnchor,
            height: view.heightAnchor,
            heightMultiplier: 0.3
        )
        
        languageTitleSubtitleView.anchor(
            top: imageView.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: SpacingRule.space20,
            leftConstant: SpacingRule.space16,
            rightConstant: SpacingRule.space16
        )
        
        typeTitleSubtitleView.anchor(
            top: languageTitleSubtitleView.bottomAnchor,
            left: languageTitleSubtitleView.leftAnchor,
            right: languageTitleSubtitleView.rightAnchor,
            topConstant: SpacingRule.space8
        )
        
        ratingTitleSubtitleView.anchor(
            top: typeTitleSubtitleView.bottomAnchor,
            left: typeTitleSubtitleView.leftAnchor,
            right: typeTitleSubtitleView.rightAnchor,
            topConstant: SpacingRule.space8
        )
    
        genreTitleSubtitleView.anchor(
            top: ratingTitleSubtitleView.bottomAnchor,
            left: ratingTitleSubtitleView.leftAnchor,
            right: ratingTitleSubtitleView.rightAnchor,
            topConstant: SpacingRule.space8
        )
        
        summaryTitleLabel.anchor(
            top: genreTitleSubtitleView.bottomAnchor,
            left: genreTitleSubtitleView.leftAnchor,
            right: genreTitleSubtitleView.rightAnchor,
            topConstant: SpacingRule.space16
        )
        
        summaryLabel.anchor(
            top: summaryTitleLabel.bottomAnchor,
            left: summaryTitleLabel.leftAnchor,
            bottom: containerView.bottomAnchor,
            right: summaryTitleLabel.rightAnchor,
            topConstant: SpacingRule.space8,
            bottomConstant: SpacingRule.space28
        )
    }
    
    private func setupViewProperties() {
        view.backgroundColor = AppColor.midnightBlueDark
        containerView.backgroundColor = AppColor.midnightBlueDark
    }
    
    private func setupScrollViewProperties() {
        scrollView.isPagingEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = false
    }
    
    private func setupImageViewProperties() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    private func setupSummaryTitleLabelProperties() {
        summaryTitleLabel.numberOfLines = 1
        summaryTitleLabel.textAlignment = .left
        summaryTitleLabel.textColor = AppColor.white
        summaryTitleLabel.font = AppFont.montserratSemiBoldSmall
    }
    
    private func setupSummaryLabelProperties() {
        summaryLabel.numberOfLines = 0
        summaryLabel.textAlignment = .left
        summaryLabel.textColor = AppColor.white
        summaryLabel.font = AppFont.montserratRegularSmall
    }
    
    private func setupTitleDetails() {
        languageTitleSubtitleView.title = "tv_show_language".localized()
        typeTitleSubtitleView.title = "tv_show_type".localized()
        ratingTitleSubtitleView.title = "tv_show_rating".localized()
        genreTitleSubtitleView.title = "tv_show_genre".localized()
        summaryTitleLabel.text = "tv_show_summary".localized()
    }
}
