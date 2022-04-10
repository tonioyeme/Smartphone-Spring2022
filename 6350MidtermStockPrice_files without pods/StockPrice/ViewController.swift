//
//  ViewController.swift
//  StockPrice
//
//  Created by FordToni on 2022/4/10.
//

import UIKit
import SwiftSpinner
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    let stocks = ["FB", "AAPL", "GOOG", "MSFT", "AMZN"]

    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var txtSymbol: UITextField!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayHigh: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getQuote(_ sender: Any) {
        guard let Symbol = txtSymbol.text else {return }
        
        let url = "\(StockQuoteURL)\(Symbol.uppercased())?apikey=\(apiKey)"

    
        SwiftSpinner.show("Getting Stock quote for \(Symbol)")
    
        AF.request(url).responseJSON { response in
        SwiftSpinner.hide(nil)
        if response.error != nil {
            print(response.error!)
            return
            }
        

        let stocks = JSON(response.data!).array
        guard let stock = stocks!.first else { return}
        
        let quote = StockQuote()
            quote.Symbol = stock["symbol"].stringValue
        quote.CompanyName = stock["name"].stringValue
        quote.Price = stock["price"].intValue
        quote.DayHigh = stock["dayHigh"].intValue
        quote.DayLow = stock["dayLow"].intValue
        
        self.lblCompanyName.text = quote.CompanyName
        self.lblPrice.text = "\(quote.Price)"
        self.lblDayHigh.text = "\(quote.DayHigh)"
        self.lblDayLow.text = "\(quote.DayLow)"
    }

}
    
    
}

