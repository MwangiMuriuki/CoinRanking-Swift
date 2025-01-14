//
//  ServiceCaller.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation

final class ServiceCaller {
    init(){}

    var token = "coinrankingb3a5a9b5366be55f11c2ccda31376a1de6d7133b72268869"

    /// Fetch All Coins
    /// - Parameter completion: Handle on completion Success or Error
    public func fetchCoinData(pageLimit: Int, completion: @escaping(Result<[CoinData], Error>) -> Void) {
        print("Fetching Coin Listings.... ")

        guard let apiUrl = Constants.getAllCoinsURL else{
            return
        }

        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

        var components = URLComponents(url: apiUrl, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "limit", value: "\(pageLimit)"),
        ]
        request.url = components.url

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
                    if coinDataResponse.status == "success"{
                        completion(.success(coinDataResponse.data?.coins ?? []))
                    }
                    else {
                        print("FAILURE: There was an error fetching coin details. Status Code - \(String(describing: coinDataResponse.message))")
                    }

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

        guard let detailsApiUrl = Constants.getCoinDetailsURL?.appendingPathComponent(coinUUID) else{
            return
        }

        var request = URLRequest(url: detailsApiUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

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
                    if coinDetailResponse.status == "success"{
                        completion(.success((coinDetailResponse.data?.coin)!))
                    }
                    else {
                        print("FAILURE: There was an error fetching coin details. Status Code - \(String(describing: coinDetailResponse.message))")
                    }

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

    /// Fetch Single Coin History Data
    /// - Parameters:
    ///   - coinUUID: Coin's provided uuid
    ///   - completion: Hanlde on Completion Success or Error
    public func fetchCoinHistoryData(coinUUID: String, completion: @escaping(Result<HistoryData, Error>) -> Void) {
        print("Fetching Coin History.... ")

//        guard let detailsApiUrl = Constants.getCoinDetailsURL?.appendingPathComponent(coinUUID) else{
//            return
//        }

        guard let historyCoinUrl = Constants.getCoinDetailsURL?.appendingPathComponent(coinUUID).appendingPathComponent("history") else{
            return
        }

        var request = URLRequest(url: historyCoinUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response Code - \(response.statusCode)")
            }
            guard let data = data, error == nil else{
                return
            }

            do {
                let coinHistoryResponse = try JSONDecoder().decode(CoinHistoryModel.self, from: data)
                DispatchQueue.main.async {

                    if coinHistoryResponse.status == "success"{
                        completion(.success((coinHistoryResponse.data)!))
                    }
                    else {
                        print("FAILURE: There was an error fetching coin details. Status Code - \(String(describing: coinHistoryResponse.message))")
                    }
                }

                let decoded = try? JSONSerialization.jsonObject(with: data)
                print("Success Fetching Coin History:", String(describing: decoded))
                NSLog("NSSuccess: ", String(describing: decoded))

            }
            catch {
                completion(.failure(error))
                print("Error Fetching Coin History:", error)
                NSLog("NSError: \(error)", error.localizedDescription)
            }
        }

        task.resume()


    }



}
