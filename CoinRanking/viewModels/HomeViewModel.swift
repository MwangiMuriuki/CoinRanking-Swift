//
//  HomeViewModel.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation

enum SortingOption {
    case rank, rankReversed, price, priceReversed, the24HVolume, the24HVolumeReversed
}

class HomeViewModel: ObservableObject {
    private let serviceCaller = ServiceCaller()
    private let favouritesDataService = FavouritesDataService()
    @Published var coinItems = [CoinData]()
    @Published var isLoading: Bool = false
    @Published var sortingOption: SortingOption = .rank
    @Published var savedEntities = [FavouritesEntity]()
    @Published var pageLimit: Int = 20
    @Published var pageLaoding: Bool = false


    // MARK: - Fetch All Coins
    public func fetchCoins() {
        isLoading = true
        self.serviceCaller.fetchCoinData(pageLimit: pageLimit) { result in
            self.isLoading = false
            switch result {
            case .success(let coinRankModel):
                self.coinItems = coinRankModel
            case .failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Filter All Coins
    public func filterCoins(coins: [CoinData], sortOption: SortingOption) -> [CoinData] {
        switch sortOption {
        case .rank:
            return coins.sorted { $0.rank ?? 0 < $1.rank ?? 0 }
        case .rankReversed:
            return coins.sorted { $0.rank ?? 0 > $1.rank ?? 0 }
        case .price:
            return coins.sorted { (Double($0.price ?? "0.00") ?? 0) < (Double($1.price ?? "0.00") ?? 0) }
        case .priceReversed:
            return coins.sorted { (Double($0.price ?? "0.00") ?? 0) > (Double($1.price ?? "0.00") ?? 0)}
        case .the24HVolume:
            return coins.sorted { (Double($0.change ?? "0.00") ?? 0) > (Double($1.change ?? "0.00") ?? 0) }
        case .the24HVolumeReversed:
            return coins.sorted { (Double($0.change ?? "0.00") ?? 0) < (Double($1.change ?? "0.00") ?? 0) }
        }
    }

    // MARK: - Fetch Favourites
    public func getFavouriteCoins() -> [FavouritesEntity] {
        savedEntities = favouritesDataService.savedEntities
        return savedEntities
    }

    // MARK: - Delete Single Coin
    public func deleteCoinsEntity(coinEntity: FavouritesEntity) -> [FavouritesEntity] {
        favouritesDataService.deleteData(entity: coinEntity)
        savedEntities = favouritesDataService.savedEntities
        return savedEntities
    }

    public func addCoinEntity(coinData: CoinData){
        favouritesDataService.addCoinHandler(coin: coinData)
    }

//    public func favouritesService(coin: CoinData){
//        favouritesDataService.favouritesHandler(coin: coin)
//    }
}
