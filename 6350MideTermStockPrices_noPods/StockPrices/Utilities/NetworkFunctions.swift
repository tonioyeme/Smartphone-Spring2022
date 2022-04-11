//
//  NetworkFunctions.swift
//  StockPrices
//
//  Created by FordToni on 2022/4/11.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

func getcompanyQuoteURL(_ symbol : String) -> String {
    let url = "\(companyQuoteURL)\(symbol)?apikey=\(APIKey)"
    return url
}


func getCompanyData(_ url : String) -> Promise<StockModel>{
    
    return Promise<StockModel> { seal -> Void in
        
        AF.request(url).responseJSON { response in
        
            if response.error != nil {
                seal.reject(response.error!)
            }
            
            let stockModel = StockModel("", "")
            //get data here
            let StockModel = JSON(response.data!).arrayValue
            
            guard let stockJSON = StockModel.first else {return seal.fulfill(stockModel)}
            
            stockModel.companyName = stockJSON["name"].stringValue
            stockModel.symbol = stockJSON["stock"].stringValue
            stockModel.price = stockJSON["price"].doubleValue
            stockModel.dayLow = stockJSON["dayHigh"].doubleValue
            stockModel.dayHigh = stockJSON["dayLow"].doubleValue
            
            
            seal.fulfill(stockModel)

        }// end of response
    }// end is return Promise
}// end of function
