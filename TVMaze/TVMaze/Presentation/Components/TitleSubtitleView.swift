import UIKit

class TitleSubtitleView: UIView {
    
    let titleLabel: UILabel
    let subtitleLabel: UILabel
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set(value){
            titleLabel.text = value
        }
    }
    
    var subtitle: String? {
        get{
            return subtitleLabel.text
        }
        set(value){
            subtitleLabel.text = value
        }
    }
    
    public init() {
        self.titleLabel = UILabel()
        self.subtitleLabel = UILabel()
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        layoutIfNeeded()
    }
}

extension TitleSubtitleView {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupTitleLabelProperties()
        setupSubtitleLabelProperties()
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.anchor(
            top: topAnchor,
            left: leftAnchor
        )
        
        subtitleLabel.anchor(
            top: topAnchor,
            left: titleLabel.rightAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            leftConstant: SpacingRule.space12
        )
    }
    
    private func setupTitleLabelProperties() {
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        titleLabel.textColor = AppColor.sand30
        titleLabel.font = AppFont.montserratRegularSmall
        
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh + 1, for: .horizontal)
    }
    
    private func setupSubtitleLabelProperties() {
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .left
        subtitleLabel.lineBreakMode = .byWordWrapping
        subtitleLabel.textColor = AppColor.white
        subtitleLabel.font = AppFont.montserratSemiBoldSmall
    }
}

