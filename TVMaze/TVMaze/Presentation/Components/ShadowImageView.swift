import UIKit

class ShadowImageView: UIView {
 
    let imageView: UIImageView
    let darkAlphaView: UIView
    
    var imageUrl: String? {
        didSet {
            if let value = imageUrl, let url = URL(string: value) {
                imageView.af.setImage(withURL: url, imageTransition: .crossDissolve(0.2))
            } else {
                imageView.image = .none
            }
        }
    }
    
    var roundCorners: Bool

    public init(roundCorners: Bool = true) {
        self.roundCorners = roundCorners
        self.imageView = UIImageView()
        self.darkAlphaView = UIView()
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShadowImageView {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupdarkAlphaViewProperties()
        setupImageViewProperties()
    }
    
    private func setupSubviews() {
        addSubview(imageView)
        addSubview(darkAlphaView)
    }
    
    private func setupConstraints() {
        imageView.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor
        )

        darkAlphaView.anchor(
            top: imageView.topAnchor,
            left: imageView.leftAnchor,
            bottom: imageView.bottomAnchor,
            right: imageView.rightAnchor
        )
    }
    
    private func setupdarkAlphaViewProperties() {
        darkAlphaView.backgroundColor = AppColor.blackAlpha35
    }
    
    private func setupImageViewProperties() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if roundCorners {
            imageView.roundAllCorners(radius: SpacingRule.space8)
            darkAlphaView.roundAllCorners(radius: SpacingRule.space8)
        }
    }
}

