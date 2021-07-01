import Foundation
import UIKit

public class HomeProvider: Provider<UINavigationController> {
    
    public override func instance() -> UINavigationController {
        return UINavigationController(rootViewController: HomeViewController())
    }
}
