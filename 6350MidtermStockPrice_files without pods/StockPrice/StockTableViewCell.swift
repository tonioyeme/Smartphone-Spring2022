//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by FordToni on 2022/4/10.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStock: UILabel!
    
    var stockSymbol = ""
    var stock = ""
    
    var sendStockDelegate : SendStockDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func getPrice(_ sender: Any) {
        let currentURL = getCurrentStockURL(stockSymbol)
        getQuote(currentURL).done { StockQuote in StockQuote.Symbol = self.Symbol
            self.sendStockDelegate?.sendStockData(StockQuote)
        }
        .catch { error in print(error.localizedDescription)}
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
