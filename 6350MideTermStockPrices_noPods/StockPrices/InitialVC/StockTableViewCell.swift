//
//  StockTableViewCell.swift
//  StockPrices
//
//  Created by FordToni on 2022/4/11.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    var sendStockDelegate : SendStockDelegate?
    
    var symbol = ""
    
    var companyName = ""

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func getPriceAction(_ sender: Any) {
        let url = getcompanyQuoteURL(symbol)
                
        getCompanyData(url)
        .done { stockModel in
            self.sendStockDelegate?.sendStockData(stockModel)
            
        }
        .catch { error in
            print(error.localizedDescription)
        }
        
        
    }

   
    
}
