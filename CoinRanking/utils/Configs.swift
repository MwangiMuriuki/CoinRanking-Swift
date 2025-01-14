//
//  Configs.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation
import SwiftUI
import SwiftUICore

class Configs{
    static let shared = Configs()
    private init() { }

    func formatPriceString(priceValue: String) -> String {
        let number = Double(priceValue) ?? 0
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        let formattedValue = formatter.string(from: NSNumber(value: number))

        return formattedValue ?? "00.00"

    }

    func formattedTimeStamp(epochTimestamp: TimeInterval) -> String {
            // Convert epoch to Date
            let date = Date(timeIntervalSince1970: epochTimestamp)

            // Format the date
            let formatter = DateFormatter()
            formatter.dateStyle = .medium // e.g., Jan 1, 2023
            formatter.timeStyle = .short // e.g., 12:00 AM

            return formatter.string(from: date)
        }


}
