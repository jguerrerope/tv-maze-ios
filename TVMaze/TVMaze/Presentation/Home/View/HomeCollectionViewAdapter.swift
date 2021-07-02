import UIKit

protocol HomeCollectionViewAdapterDelegate: AnyObject {
    
    func onNextPageReached(id: String)
    
    func onTVShowselected(id: String)
}

class HomeCollectionViewAdapter: BaseTableAdapter<HomeSectionViewPayload> {

    weak var delegate: HomeCollectionViewAdapterDelegate?

    public override init(tableView: UITableView) {
        super.init(tableView: tableView)
        registerCollectionViewCels()
    }
    
    deinit {
        print(String(describing: HomeCollectionViewAdapter.self))
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
            return cell
            
        case .nextPage:
            let cell: NextPageViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
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
            delegate?.onTVShowselected(id: payload.id)
        default:
            break
        }
    }
}

extension HomeCollectionViewAdapter {
    
    private func registerCollectionViewCels() {
        tableView.register(TVShowViewCell.self)
        tableView.register(NextPageViewCell.self)
    }
}

