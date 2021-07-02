import UIKit
import AlamofireImage

class NextPageViewCell: UITableViewCell {
    
    let containerView: SkeletonView
    let indicatorView: UIView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.containerView = SkeletonView()
        self.indicatorView = UIView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
