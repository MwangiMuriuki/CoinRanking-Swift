//
//  TableHeaderColumn.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import SwiftUI

struct TableHeaderColumn: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @Binding var coinsList: [CoinData]


    var body: some View {
        HStack {
            HStack (spacing: 4){
                Text("#")
                    .font(.custom("AvenirNext-Medium", size: 14))
                    .foregroundStyle(.textColorSecondary)
                    .frame(alignment: .leading)

                Image(systemName: "arrow.down.circle.fill").resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.colorGreen)
                    .opacity((homeViewModel.sortingOption == .rank || homeViewModel.sortingOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: homeViewModel.sortingOption == .rank ? 0 : 180))

            }
            .padding(.trailing, 2)
            .frame(width: 30, alignment: .leading)
            .onTapGesture {
                withAnimation(.default){
                    if homeViewModel.sortingOption == .rank {
                        homeViewModel.sortingOption = .rankReversed
                        homeViewModel.coinItems = homeViewModel.filterCoins(coins: coinsList, sortOption: homeViewModel.sortingOption)
                    } else {
                        homeViewModel.sortingOption = .rank
                        homeViewModel.coinItems = homeViewModel.filterCoins(coins: coinsList, sortOption: homeViewModel.sortingOption)
                    }
                }
            }

            Text("Coin")
                .font(.custom("AvenirNext-Medium", size: 14))
                .foregroundStyle(.textColorSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            HStack(spacing: 4) {
                Spacer()

                Text("Price")
                    .font(.custom("AvenirNext-Medium", size: 14))
                    .foregroundStyle(.textColorSecondary)
                    .multilineTextAlignment(.trailing)

                Image(systemName: "arrow.down.circle.fill").resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.colorGreen)
                    .opacity((homeViewModel.sortingOption == .price || homeViewModel.sortingOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: homeViewModel.sortingOption == .price ? 0 : 180))

            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default){

//                    homeViewModel.sortingOption = homeViewModel.sortingOption == .price ? .priceReversed : .price
                    if homeViewModel.sortingOption == .price {
                        homeViewModel.sortingOption = .priceReversed
                        homeViewModel.coinItems = homeViewModel.filterCoins(coins: coinsList, sortOption: homeViewModel.sortingOption)
                    } else {
                        homeViewModel.sortingOption = .price
                        homeViewModel.coinItems = homeViewModel.filterCoins(coins: coinsList, sortOption: homeViewModel.sortingOption)
                    }

                }

            }


            Spacer()

            HStack(spacing: 4) {
                Spacer()

                Text("24H%")
                    .font(.custom("AvenirNext-Medium", size: 13))
                    .foregroundStyle(.textColorSecondary)

                Image(systemName: "arrow.down.circle.fill")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.colorGreen)
                    .opacity((homeViewModel.sortingOption == .the24HVolume || homeViewModel.sortingOption == .the24HVolumeReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: homeViewModel.sortingOption == .the24HVolume ? 0  : 180))

            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default){
//                    homeViewModel.sortingOption = homeViewModel.sortingOption == .the24HVolume ? .the24HVolumeReversed : .the24HVolume

                    if homeViewModel.sortingOption == .the24HVolume {
                        homeViewModel.sortingOption = .the24HVolumeReversed
                        homeViewModel.coinItems = homeViewModel.filterCoins(coins: coinsList, sortOption: homeViewModel.sortingOption)
                    } else {
                        homeViewModel.sortingOption = .the24HVolume
                        homeViewModel.coinItems = homeViewModel.filterCoins(coins: coinsList, sortOption: homeViewModel.sortingOption)
                    }
                }

            }

        }
        .padding(.leading, 0)
        .padding(.trailing, 0)
    }
}

//#Preview {
//    TableHeaderColumn()
//}
