//
//  ViewController.swift
//  StockPrices
//
//  Created by FordToni on 2022/4/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendStockDelegate{
    
    
    

    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayHigh: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
    var stocks : [StockModel] = [StockModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStocks()
        getAAPLPrice()
    }
    
    func getAAPLPrice(){
        let url = getcompanyQuoteURL("AAPL")
                
        getCompanyData(url)
        .done { stockModel in
            self.sendStockData(stockModel)
            
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
    
    
    func initStocks(){
        
        let AMZN = StockModel("Amazon", "AMZN")
        let FB = StockModel("Facebook", "FB")
        let MSFT = StockModel("Microsoft", "MSFT")
        let GOOG = StockModel("Google", "GOOG")
        let AAPL = StockModel("Apple", "AAPL")
        
        stocks.append(AMZN)
        stocks.append(FB)
        stocks.append(MSFT)
        stocks.append(GOOG)
        stocks.append(AAPL)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
                
        let stockModel = stocks[indexPath.row]
        
        cell.lblSymbol.text = stockModel.symbol
        cell.lblCompanyName.text = stockModel.companyName
        cell.symbol = stockModel.symbol
        cell.companyName = stockModel.companyName
        cell.sendStockDelegate = self
                
        return cell
    }
    
    func sendStockData(_ stockModel: StockModel) {
        lblCompanyName.text = "Company: \(stockModel.companyName)"
        lblSymbol.text = "Symbol: \(stockModel.symbol)"
        lblPrice.text = "Price: \(stockModel.price)"
        lblDayHigh.text = "Day High: \(stockModel.dayHigh)"
        lblDayLow.text = "Day Low: \(stockModel.dayLow)"
        
        
    }


}

