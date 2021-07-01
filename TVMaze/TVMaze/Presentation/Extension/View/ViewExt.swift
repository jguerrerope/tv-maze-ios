import Foundation
import UIKit

extension UIView {

    class func transitionTo(_ uiWindow: UIWindow, _ viewController: UIViewController, _ animation: UIView.AnimationOptions, completion: ((Bool) -> Void)? = nil) {
        UIView.transition(with: uiWindow, duration: 0.5, options: animation, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            uiWindow.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: completion)
    }
}
