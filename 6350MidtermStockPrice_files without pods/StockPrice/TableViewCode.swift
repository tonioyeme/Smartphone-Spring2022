//
//  TableViewCode.swift
//  StockPrice
//
//  Created by FordToni on 2022/4/10.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = stocks[indexPath.row]
        return cell
    }
}
