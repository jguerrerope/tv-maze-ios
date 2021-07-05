import UIKit

extension UINavigationController {
    
    public func setNavigationBarStyle(hidden: Bool = false,
                                      prefersLargeTitles: Bool = false,
                                      animated: Bool = false) {
        navigationBar.backIndicatorImage = UIImage(named: "whiteBackIcon")?.withRenderingMode(.alwaysOriginal)
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "whiteBackIcon")?.withRenderingMode(.alwaysOriginal)
        navigationBar.tintColor = UIColor.white
    
        
        // common
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barStyle = .default
        navigationBar.titleTextAttributes = [.foregroundColor: AppColor.white]
        navigationBar.largeTitleTextAttributes = [.foregroundColor: AppColor.white]
        setNavigationBarHidden(hidden, animated: animated)
     
        navigationBar.prefersLargeTitles = prefersLargeTitles
        
        if prefersLargeTitles {
            navigationItem.largeTitleDisplayMode = .always
        }
    }
}
