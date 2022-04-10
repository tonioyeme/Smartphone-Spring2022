//
//  Network.swift
//  StockPrice
//
//  Created by FordToni on 2022/4/10.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON
import UIKit

func getCurrentStockURL(_ stockSymbol : String) -> String{
    let url = "\(StockQuoteURL)\(stockSymbol)?apikey=\(apiKey)"
    return url
}

func getQuote(_ url : String) -> Promise<StockQuote>{
    return Promise<StockQuote> {seal -> Void in
        AF.request(url).responseJSON { response in
            if response.error != nil {
                seal.reject(response.error!)
        }
    
    let stockQuote = StockQuote()
    let stockQuoteArray = JSON(response.data!).arrayValue
    
    guard let StockSymbol = stockQuoteArray.first else {return
        seal.fulfill(stockQuote)
    
    stockQuote.Symbol = StockSymbol["symbol"].stringValue
    stockQuote.CompanyName = StockSymbol["name"].stringValue
    stockQuote.Price = StockSymbol["price"].intValue
    stockQuote.DayHigh = StockSymbol["dayHigh"].intValue
    stockQuote.DayLow = StockSymbol["dayLow"].intValue
    }
    
}

}
}
