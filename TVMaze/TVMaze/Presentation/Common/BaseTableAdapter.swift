import Foundation
import UIKit
import DeepDiff

open class BaseTableAdapter<T: DiffAware>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource: [T]
    let tableView: UITableView
    
    public required init(tableView: UITableView) {
        self.tableView = tableView
        self.dataSource = []
        super.init()
      
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    public func update(_ newDataSource: [T]) {
        if self.dataSource.isEmpty || newDataSource.isEmpty {
            self.dataSource = newDataSource
            self.tableView.reloadData()
        } else {
            let changes: [Change<T>]  = diff(old: self.dataSource, new: newDataSource)
            self.tableView.reload(changes: changes,
                                  insertionAnimation: .fade,
                                  deletionAnimation: .fade,
                                  replacementAnimation: .fade,
                                  updateData: { [weak self] in
                self?.dataSource = newDataSource
            })
        }
    }
    
    public func delete(indexPath: IndexPath) {
        var copyDataSource: [T] = []
        for value in dataSource {
            copyDataSource.append(value)
        }

        copyDataSource.remove(at: indexPath.row)
        update(copyDataSource)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        if dataSource.isEmpty {
            return 0
        }
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
}
