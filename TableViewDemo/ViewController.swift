//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Ankita Thakur on 05/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource : TableViewModel<String, UITableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustoTableViewCell.self, forCellReuseIdentifier: "CustoTableViewCell")
        let items = ["Apple","Banana", "Cherry"]
        let cellConfigurator: CellConfigurator<String,UITableViewCell> = { cell,item in
            cell.textLabel?.text = item
            // or
           // cell.configure(with: item)
        }
        dataSource = TableViewModel(items: items, cellIdentifier: "CustoTableViewCell", cellConfigurator: cellConfigurator)
        tableView.dataSource = dataSource
        // Do any additional setup after loading the view.
    }


}

class CustoTableViewCell: UITableViewCell, ConfigurableCell{
    func configure(with data: String) {
        textLabel?.text = data
    }
    
    typealias DataType = String
    
    
}
