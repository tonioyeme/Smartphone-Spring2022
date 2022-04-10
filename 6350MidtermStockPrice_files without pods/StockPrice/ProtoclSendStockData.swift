//
//  ProtoclSendStockData.swift
//  StockPrice
//
//  Created by FordToni on 2022/4/10.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ stockModel : StockQuote)
}
