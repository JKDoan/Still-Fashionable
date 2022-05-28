//
//  BuyViewController.swift
//  Still Fashionable V2
//
//  Created by Jenny Kim Doan on 15/03/2022.
//

import UIKit

class BuyViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    let data = ["First", "Second"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

}
