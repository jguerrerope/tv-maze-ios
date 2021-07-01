import UIKit

protocol HomeCollectionViewAdapterDelegate: AnyObject {
}

class HomeCollectionViewAdapter: BaseTableAdapter<TVShowItemViewPayload> {
    
    weak var delegate: HomeCollectionViewAdapterDelegate?
    
    public required init(tableView: UITableView) {
        super.init(tableView: tableView)
        registerCollectionViewCels()
    }
    
    deinit {
        print(String(describing: HomeCollectionViewAdapter.self))
    }

    private func registerCollectionViewCels() {
        tableView.register(TVShowViewCell.self)
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let payload = dataSource[indexPath.item]
        let cell: TVShowViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(payload: payload)
        cell.selectionStyle = .none
        return cell
    }
}

