//
//  TableViewController.swift
//  TableViewControllerExample
//
//  Created by FordToni on 2022/2/7.
//

import UIKit

/*
 1. remove view controller from storyboard and remove the code
 2. add a tableViewController to the storyboard and add "cell" as reusable identifier
 3. male the tableview as initial VC
 4. add tableViewController code file and map UI and code file
 5.remove boiler plate code and have 2 functions numberOfRowsInsection and cellForRowAt
 6. add array and return arr.count in numberofRowsInSection
 7. Return the cell(configure cell to use the array)
 
 */


class TableViewController: UITableViewController {
    
    let arr = ["Mark","Bill","Tom"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arr[indexPath.row]

        return cell
    }

    

}
