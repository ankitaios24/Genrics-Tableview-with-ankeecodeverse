//
//  TableViewModel.swift
//  TableViewDemo
//
//  Created by Ankita Thakur on 05/05/24.
//

import UIKit

// Define a protocol for the cell configuration
protocol ConfigurableCell {
    associatedtype DataType
    func configure(with data: DataType)
}

typealias CellConfigurator<Item,Cell> = (Cell,Item) -> Void

class TableViewModel<Item,Cell: UITableViewCell>: NSObject,UITableViewDataSource{
    
    var items: [Item] = []
    var cellIdentifier: String = ""
    var cellConfigurator: CellConfigurator<Item,Cell>
    
    init(items: [Item], cellIdentifier: String, cellConfigurator: @escaping CellConfigurator<Item, Cell>) {
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
        
        let item = items[indexPath.row]
        cellConfigurator(cell,item)
        return cell
    }
    
    
    
    
}
