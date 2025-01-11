//
//  Date+Extensions.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation

extension Date {
    func updateHour(value: Int) -> Date{
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
}
