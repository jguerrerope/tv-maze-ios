import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier())
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier(), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier())")
        }
        return cell
    }
}
