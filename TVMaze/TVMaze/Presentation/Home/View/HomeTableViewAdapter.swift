import UIKit

protocol HomeTableViewAdapterDelegate: AnyObject {
    
    func onNextPageReached(id: String)
    
    func onTVShowTapped(id: String)
}

class HomeTableViewAdapter: BaseTableAdapter<HomeSectionViewPayload> {

    weak var delegate: HomeTableViewAdapterDelegate?

    public override init(tableView: UITableView) {
        super.init(tableView: tableView)
        registerCollectionViewCels()
    }

    private func registerCollectionViewCels() {
        tableView.register(TVShowViewCell.self)
        tableView.register(NextPageViewCell.self)
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource[indexPath.item]
        switch item {
        case .show(let payload):
            let cell: TVShowViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(payload: payload)
            cell.selectionStyle = .none
            
            #if DEBUG
            cell.accessibilityIdentifier = "tvShowCell_\(indexPath.item)"
            cell.isAccessibilityElement = true
            #endif
            return cell
            
        case .nextPage:
            let cell: NextPageViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            
            #if DEBUG
            cell.accessibilityIdentifier = "nextPageCell"
            cell.isAccessibilityElement = true
            #endif
            return cell
        }
    }
    
    public override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = dataSource[indexPath.item]
        switch item {
        case .nextPage(let id):
            delegate?.onNextPageReached(id: id)
        default:
            break
        }
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch dataSource[indexPath.item] {
        case .show(let payload):
            delegate?.onTVShowTapped(id: payload.id)
        default:
            break
        }
    }
}

