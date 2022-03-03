//
//  StockViewController.swift
//  NailStocks
//
//  Created by Toni Ford on 2/20/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockRating: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getStockRating(_ sender: Any) {
    
        guard let symbol = txtStockSymbol.text else {return }
    
        
        let url = "\(companyStockRatingURL)\(symbol.uppercased())?apikey=\(apiKey)"
        
        print(url)
        
        SwiftSpinner.show("Getting Stock Rating for \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            // If I am here then I have got the data
            
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else { return}
            
            print(stock)
            let rating = CompanyStockRating()
            rating.symbol = stock["symbol"].stringValue
            rating.date = stock["date"].stringValue
            rating.rating = stock["rating"].stringValue
            rating.ratingScore = stock["ratingScore"].intValue
            rating.ratingRecommendation = stock["ratingRecommendation"].stringValue
            
            self.lblStockRating.text = "\(rating.symbol) : \(rating.date) : \(rating.rating) : \(rating.ratingScore) : \(rating.ratingRecommendation) $"

            
        }
        
    }
    
}
