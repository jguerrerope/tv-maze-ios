import UIKit
import AlamofireImage

class TVShowViewCell: UITableViewCell {
    
    let containerView: ShadowContainerView
    let darkAlphaView: UIView
    let showImageView: UIImageView
    let titleLabel: UILabel

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.containerView = ShadowContainerView()
        self.darkAlphaView = UIView()
        self.showImageView = UIImageView()
        self.titleLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TVShowViewCell {
    
    func configure(payload: TVShowItemViewPayload) {
        // Title label
        titleLabel.text = payload.title
        
        // Image
        if let url = URL(string: payload.image) {
            showImageView.af.setImage(withURL: url, imageTransition: .crossDissolve(0.2))
        }
        self.layoutIfNeeded()
    }
}
