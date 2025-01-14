//
//  CoinRankingApp.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import SwiftUI
import SDWebImageSVGCoder
import SDWebImage

@main
struct CoinRankingApp: App {

    init() {
           setUpDependencies() // Initialize SVGCoder
       }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

// Initialize SVGCoder
private extension CoinRankingApp {

    func setUpDependencies() {
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
}
