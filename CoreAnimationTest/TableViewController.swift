//
//  TableViewController.swift
//  CoreAnimationTest
//
//  Created by Shamil Bayramli on 16.06.25.
//

import UIKit

class TableViewController: UITableViewController {
    
    struct TableItem
    {
        let title: String
        let viewController: UIViewController
        
        init(_ title: String, _ viewController: UIViewController) {
            self.title = title
            self.viewController = viewController
        }
    }
    
    let viewControllers =
    [
        TableItem("Move", MoveViewController()),
        TableItem("Scale", ScaleViewController()),
        TableItem("Rotate", RotateViewController()),
        TableItem("Shake", ShakeViewController()),
        TableItem("Circling", CirclingViewController()),
        TableItem("RingingBell", RingingBellViewController())
    ]
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews()
    {
        navigationItem.title = "Core Animation Test"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        var config = UIListContentConfiguration.cell()
        config.text = viewControllers[indexPath.row].title
        cell.contentConfiguration = config
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(viewControllers[indexPath.row].viewController, animated: true)
    }
}
