//
//  CoinHistoryModel.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 13/01/2025.
//

import Foundation


// MARK: - CoinHistoryModel
struct CoinHistoryModel: Codable {
    let status: String?
    let data: HistoryData?
    let message: String?
}

// MARK: - DataClass
struct HistoryData: Codable {
    let change: String?
    var history: [CoinHistory]?
}

// MARK: - History
struct CoinHistory: Codable, Hashable {
    let price: String?
    let timestamp: Int?
}
