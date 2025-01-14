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
    @Published var sparklineData = [String?]()
    @Published var isLoading: Bool = false
//    @Published var singleCoinHistoryData: HistoryData?
//    @Published var coinHistoryList = [CoinHistory]()


//    public func getCoinDetails(passedUUID: String){
//        let dispatchGroup = DispatchGroup()
//
//        dispatchGroup.enter()
//        fetchCoinData(passedUUID: passedUUID)
//        dispatchGroup.leave()
//
//        dispatchGroup.enter()
//        fetchCoinHistory(passedUUID: passedUUID)
//        dispatchGroup.leave()
//
//        dispatchGroup.notify(queue: .main) {
//            print("Dispatch Queue Completed")
//        }
//
//    }

    public func fetchCoinData(passedUUID: String) {
        isLoading = true
        self.serviceCaller.fetchCoinDetailData(coinUUID: passedUUID, completion: { result in
            self.isLoading = false
            switch result {
            case .success(let coinDetailModel):
                self.singleCoinData = coinDetailModel
                self.sparklineData = coinDetailModel.sparkline ?? []
            case .failure(let error):
                print(error)
            }
        })
    }

//    public func fetchCoinHistory(passedUUID: String) {
//        isLoading = true
//        self.serviceCaller.fetchCoinHistoryData(coinUUID: passedUUID, completion: { result in
//            self.isLoading = false
//            switch result {
//            case .success(let coinHistoryModel):
//                self.singleCoinHistoryData = coinHistoryModel
//                self.coinHistoryList = coinHistoryModel.history ?? []
//            case .failure(let error):
//                print(error)
//            }
//        })
//
//    }
}
