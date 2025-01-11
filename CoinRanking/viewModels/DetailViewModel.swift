//
//  DetailViewModel.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 11/01/2025.
//

import Foundation


class DetailViewModel: ObservableObject {
    private let serviceCaller = ServiceCaller()
    @Published var singleCoinData: SingleCoinData?
    @Published var isLoading: Bool = false



    public func fetchCoinData(passedUUID: String) {
        isLoading = true
        self.serviceCaller.fetchCoinDetailData(coinUUID: passedUUID, completion: { result in
            self.isLoading = false
            switch result {
            case .success(let coinDetailModel):
                self.singleCoinData = coinDetailModel
            case .failure(let error):
                print(error)
            }
        })
    }
}
