//
//  CoinDetailModel.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 11/01/2025.
//

import Foundation

// MARK: - CoinDetailModel
struct CoinDetailModel: Codable {
    let status: String?
    let data: DetailDataClass?
}

// MARK: - DataClass
struct DetailDataClass: Codable {
    let coin: SingleCoinData?
}

// MARK: - Coin
struct SingleCoinData: Codable {
    let uuid, symbol, name, description: String?
    let color: String?
    let iconURL: String?
    let websiteURL: String?
    let links: [CoinLink?]?
    let supply: Supply?
    let numberOfMarkets, numberOfExchanges: Int?
    let the24HVolume, marketCap, fullyDilutedMarketCap, price: String?
    let btcPrice: String?
    let priceAt: Int?
    let change: String?
    let rank: Int?
    let sparkline: [String?]?
    let allTimeHigh: AllTimeHigh?
    let coinrankingURL: String?
    let tier: Int?
    let lowVolume: Bool?
    let listedAt: Int?
    let hasContent: Bool?
    let notices: String?
    let contractAddresses: [String?]?
    let tags: [String]?

    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, description, color
        case iconURL = "iconUrl"
        case websiteURL = "websiteUrl"
        case links, supply, numberOfMarkets, numberOfExchanges
        case the24HVolume = "24hVolume"
        case marketCap, fullyDilutedMarketCap, price, btcPrice, priceAt, change, rank, sparkline, allTimeHigh
        case coinrankingURL = "coinrankingUrl"
        case tier, lowVolume, listedAt, hasContent, notices, contractAddresses, tags
    }
}

// MARK: - AllTimeHigh
struct AllTimeHigh: Codable {
    let price: String?
    let timestamp: Int?
}

// MARK: - Link
struct CoinLink: Codable {
    let name: String?
    let url: String?
    let type: String?
}

// MARK: - Supply
struct Supply: Codable {
    let confirmed: Bool?
    let supplyAt: Int?
    let max, total, circulating: String?
}

