import UIKit

class TVShowViewCell: UITableViewCell {
    
    let containerView: ShadowContainerView
    
    let shadowImageView: ShadowImageView
    let titleLabel: UILabel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.containerView = ShadowContainerView()
        self.shadowImageView = ShadowImageView()
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
        titleLabel.text = payload.title
        shadowImageView.imageUrl = payload.image
        self.layoutIfNeeded()
    }
}
