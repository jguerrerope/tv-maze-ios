import UIKit

class CardContainerView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.shadowRadius = 11.0 / 2.0
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowOpacity = 1
    }
}
