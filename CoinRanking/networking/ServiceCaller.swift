//
//  ServiceCaller.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation

final class ServiceCaller {
    init(){}
    
    /// Fetch All Coins
    /// - Parameter completion: Handle on completion Success or Error
    public func fetchCoinData(completion: @escaping(Result<[CoinData], Error>) -> Void) {
        print("Fetching Coin Listings.... ")

        guard let apiUrl = Constants.getAllCoinsURL else{
            return
        }

        let request = URLRequest(url: apiUrl)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response Code - \(response.statusCode)")
            }
            guard let data = data, error == nil else{
                return
            }

            do {
                let coinDataResponse = try JSONDecoder().decode(CoinRankingModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(coinDataResponse.data?.coins ?? []))
                }
                let decoded = try? JSONSerialization.jsonObject(with: data)
                print("Success Fetching Coin Listings:", String(describing: decoded))
                NSLog("NSSuccess: ", String(describing: decoded))

            }
            catch {
                completion(.failure(error))
                print("Error Fetching Coin Listings:", error)
                NSLog("NSError: \(error)", error.localizedDescription)
            }
        }

        task.resume()

    }
    
    /// Fetch Single Coin Detail Data
    /// - Parameters:
    ///   - coinUUID: Coin's provided uuid
    ///   - completion: Hanlde on Completion Success or Error
    public func fetchCoinDetailData(coinUUID: String, completion: @escaping(Result<SingleCoinData, Error>) -> Void) {
        print("Fetching Coin Details.... ")

        guard let apiUrl = Constants.getCoinDetailsURL?.appendingPathComponent(coinUUID) else{
            return
        }

        let request = URLRequest(url: apiUrl)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response Code - \(response.statusCode)")
            }
            guard let data = data, error == nil else{
                return
            }

            do {
                let coinDetailResponse = try JSONDecoder().decode(CoinDetailModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success((coinDetailResponse.data?.coin)!))
                }

                let decoded = try? JSONSerialization.jsonObject(with: data)
                print("Success Fetching Coin Details:", String(describing: decoded))
                NSLog("NSSuccess: ", String(describing: decoded))

            }
            catch {
                completion(.failure(error))
                print("Error Fetching Coin Listings:", error)
                NSLog("NSError: \(error)", error.localizedDescription)
            }
        }

        task.resume()

    }


}
