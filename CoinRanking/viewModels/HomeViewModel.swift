//
//  HomeViewModel.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation


class HomeViewModel: ObservableObject {
    private let serviceCaller = ServiceCaller()
    @Published var coinItems = [CoinData]()
    @Published var isLoading: Bool = false


    public func fetchCoins() {
        isLoading = true
        self.serviceCaller.fetchCoinData { result in
            self.isLoading = false
            switch result {
            case .success(let coinRankModel):
                self.coinItems = coinRankModel
            case .failure(let error):
                print(error)
            }
        }
    }
}
