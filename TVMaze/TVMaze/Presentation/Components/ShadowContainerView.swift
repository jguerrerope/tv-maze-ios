import UIKit

public class ShadowContainerView: UIView {
    
    private let theBorderWidth: CGFloat = 2.0

    public var borderEnabled: Bool = false {
        didSet {
            layer.borderWidth = borderEnabled ? theBorderWidth : 0
        }
    }
}

extension ShadowContainerView {

    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = borderEnabled ? theBorderWidth : 0
        layer.cornerRadius = SpacingRule.space8
        layer.shadowColor = AppColor.blackAlpha35.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3.0)
        layer.shadowRadius = SpacingRule.space8
        layer.shadowOpacity = 0.8
        layer.borderColor = AppColor.midnightBlueDark.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}
