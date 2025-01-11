//
//  Constants.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation


struct Constants {
    static let BASE_URL = URL(string: "https://api.coinranking.com/v2/")
    static let getAllCoinsURL = BASE_URL?.appendingPathComponent("coins")
    static let getCoinDetailsURL = BASE_URL?.appendingPathComponent("coin/")
}
