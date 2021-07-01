import Foundation
import UIKit

extension SplashViewController {
    
    func setupUI() {
        view.backgroundColor = AppColor.midnightBlueDark
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
        iconImageView.image = UIImage(named: "splash")
    }
}
