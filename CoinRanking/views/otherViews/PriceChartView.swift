//
//  PriceChartView.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 11/01/2025.
//

import SwiftUI
import Charts

struct PriceChartView: View {

    @ObservedObject var detailViewModel = DetailViewModel()
    @State var coinUUID: String
    @State var chartValues: [String?]?


    private var areaBackground: Gradient {
        if detailViewModel.singleCoinData?.change?.description.contains("-") == true {
            return Gradient(colors: [Color.colorRed, Color.colorRed.opacity(0.1)])
        }
        else {
            return Gradient(colors: [Color.colorGreen, Color.colorGreen.opacity(0.1)])
        }
    }

    private var lineColor: Color {
        if detailViewModel.singleCoinData?.change?.description.contains("-") == true {
            return Color(.colorRed)
        }
        else {
            return Color(.colorGreen)
        }
    }

    func fetchMinMax() -> (min: Double, max: Double)? {
        let doubleValues = detailViewModel.sparklineData.compactMap { Double($0 ?? "") }
        if let minValue = doubleValues.min(), let maxValue = doubleValues.max() {
            return (min: minValue, max: maxValue)
        }
        return nil

    }

    var body: some View {
        VStack{
            if detailViewModel.sparklineData.isEmpty == true {

                ProgressView("Loading Your Data...")
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .progressViewStyle(.circular)
                    .scaleEffect(1.1)
                    .padding()
            }
            else {

                Chart {
                    ForEach(((detailViewModel.sparklineData.compactMap{  $0 }.indices)), id: \.self) { index in
                        if let stuff = Double(detailViewModel.sparklineData[index] ?? "null") {
                            LineMark(
                                x: .value("Index", index),
                                y: .value("Value", stuff)
                            )
                            .lineStyle(.init(lineWidth: 2))
                            .foregroundStyle(lineColor)

                            AreaMark(
                                x: .value("Index", index),
                                yStart: .value("Value", stuff),
                                yEnd: .value("Value", fetchMinMax()?.min ?? 0.00)
                            )
                            .foregroundStyle(areaBackground)
                        }

                    }
                }
                .chartXAxis(.hidden)
                .chartYScale(domain: (fetchMinMax()?.min ?? 0.00)...(fetchMinMax()?.max ?? 0.00))

            }

        }

    }
}

//#Preview {
//    PriceChartView()
//}
