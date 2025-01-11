//
//  UIString+Extensions.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation

extension String {

    func roundOffStringDouble(priceValue: String) -> String {
        return String(format: "%.2f", priceValue)
    }

    var dollarPrice: String {
        return String(format: "$%.2f", self)
    }


    func formattedPrice() -> String? {
        guard let number = Double(self) else { return nil }

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        let finalForm = numberFormatter.string(from: NSNumber(value: number))

        return finalForm
    }

    func shortennedPrice() -> String? {
        guard let number = Double(self) else { return nil }

        let newDouble = formatToShortenedString(number: number)

        guard let anotherDouble = Double(newDouble) else { return nil }

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2

        let finalForm = numberFormatter.string(from: NSNumber(value: anotherDouble))

        return finalForm

    }

    func formatToShortenedString(number: Double) -> String {

        switch number {
               case 1_000_000_000...:
                   return String(format: "%.2fB", number / 1_000_000_000)
               case 1_000_000...:
                   return String(format: "%.2fM", number / 1_000_000)
//               case 1_000...:
//                   return String(format: "%.2fK", number / 1_000)
               default:
                   return String(format: "%.2f", number)
               }
    }

}
