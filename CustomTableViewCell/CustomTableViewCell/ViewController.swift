//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by FordToni on 2022/2/7.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images = ["Benedict eggs","coconut","crawfish","croissant","gyoza","hotpot","kabab","lobster","pancake","rib"]
    
    let imageNames = ["Benedict Eggs","Coconut","Crawfish","Croissant","Gyoza","hotpot","Kabab","Lobster","Pancake","Rib"]
    

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as!TableViewCell
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = imageNames[indexPath.row]
        
        
        return cell
    }


}

