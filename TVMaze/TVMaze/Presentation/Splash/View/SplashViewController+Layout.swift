import Foundation
import UIKit

extension SplashViewController {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupProperties()
    }
    
    private func setupSubviews() {
        view.addSubview(iconImageView)
    }
    
    private func setupConstraints() {
        iconImageView.anchorCenterToView(view)
        iconImageView.anchor(
            widthConstant: 180
        )
        iconImageView.equalHeightToWidth(multiplier: 1)
    }
    
    private func setupProperties() {
        view.backgroundColor = AppColor.midnightBlueDark
        iconImageView.image = UIImage(named: "splash")
    }
}
