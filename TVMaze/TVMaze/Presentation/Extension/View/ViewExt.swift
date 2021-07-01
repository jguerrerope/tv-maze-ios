import Foundation
import UIKit

extension UIView {
    class func identifier() -> String {
        return String(describing: self)
    }
    
    class func transitionTo(_ uiWindow: UIWindow, _ viewController: UIViewController, _ animation: UIView.AnimationOptions, completion: ((Bool) -> Void)? = nil) {
        UIView.transition(with: uiWindow, duration: 0.5, options: animation, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            uiWindow.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: completion)
    }
    
    func roundAllCorners(radius: CGFloat) {
        roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: radius)
    }
    
    func roundTopCorners(radius: CGFloat) {
        roundCorners(corners: [.topLeft, .topRight], radius: radius)
    }
    
    func roundBottomCorners(radius: CGFloat) {
        roundCorners(corners: [.bottomLeft, .bottomRight], radius: radius)
    }
    
    func roundLeftCorners(radius: CGFloat) {
        roundCorners(corners: [.topLeft, .bottomLeft], radius: radius)
    }
    
    func roundRightCorners(radius: CGFloat) {
        roundCorners(corners: [.topLeft, .bottomLeft], radius: radius)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
