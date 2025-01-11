//
//  PriceChartView.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 11/01/2025.
//

import SwiftUI
import Charts

struct PriceChartView: View {
    @State var chartValues: [String?]?

    private var areaBackground: Gradient {
        return Gradient(colors: [Color.green, Color.accentColor.opacity(0.1)])
      }

    var body: some View {
        VStack{

            Chart {
                ForEach((chartValues!.indices), id: \.self) { index in
                    if let stuff = Double(chartValues?[index] ?? "null") {
                        LineMark(
                            x: .value("Index", index),
                            y: .value("Value", stuff)
                        )
                        .interpolationMethod(.catmullRom)

                        AreaMark(
                            x: .value("Index", index),
                            y: .value("Value", stuff)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(areaBackground)
                    }

                }
            }
        }
    }
}

//#Preview {
//    PriceChartView()
//}
