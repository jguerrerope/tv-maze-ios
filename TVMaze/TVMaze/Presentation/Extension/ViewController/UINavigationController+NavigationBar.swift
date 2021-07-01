import UIKit

extension UINavigationController {
    
    public func setNavigationBarStyle(hidden: Bool = false, animated: Bool = false) {
        navigationBar.backIndicatorImage = UIImage(named: "whiteBackIcon")?.withRenderingMode(.alwaysOriginal)
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "whiteBackIcon")?.withRenderingMode(.alwaysOriginal)
        
        // common
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barStyle = .default
        navigationBar.titleTextAttributes = [.foregroundColor: AppColor.midnightBlueDark]
        setNavigationBarHidden(hidden, animated: animated)
    }
}
