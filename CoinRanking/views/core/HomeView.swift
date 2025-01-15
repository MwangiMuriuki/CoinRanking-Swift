//
//  ContentView.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var showFavouritesList: Bool = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10, content: {
                // MARK: - Header
                HStack {

                    Text(showFavouritesList ? "Favourites": "All Coins")
                        .font(.custom("AvenirNext-DemiBold", size: 20))

                    Spacer()

                    HStack(spacing: 8) {
                        Text(showFavouritesList ? "All Coins": "Favourites")
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundStyle(.textColorPrimary)

                        Circle()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(.buttonBackground)
                            .overlay {
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 8, height: 12)
                            }
                            .shadow(
                                color: .shadow.opacity(0.3),
                                radius: 4, x:0, y: 0
                            )
                            .rotationEffect(Angle(degrees: showFavouritesList ? 180 : 0))
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showFavouritesList.toggle()
                                }

                            }
                    }

                }

                Divider()
                    .padding(.top, 5)
                    .padding(.bottom, 5)


                // MARK: - Table Header 
                TableHeaderColumn(homeViewModel: viewModel, coinsList: $viewModel.coinItems)
                    .padding(.top, 5)

                Divider()
                    .padding(.top, 3)
                    .padding(.bottom, 8)


                // MARK: - Coin List
                if viewModel.coinItems.isEmpty{
                    ProgressView()
                        .padding(.top, 20)
                }
                else {

                    if showFavouritesList {

                        if viewModel.savedEntities.isEmpty || viewModel.savedEntities.count == 0 {

                            FavouritesPlaceholderView()
                                .padding(.top, 20)
                        }
                        else {
                            FavouritesTableView(coinsList: $viewModel.savedEntities, homeViewModel: viewModel)
                        }
                    }
                    else {
                        CoinsTableView(coinsList: $viewModel.coinItems, sortingOption: $viewModel.sortingOption, homeViewModel: viewModel)
                            .onDisappear {
                                viewModel.getFavouriteCoins()
                            }
                    }
                }

                Spacer()

            })
            .padding()
            .navigationTitle("Coin Ranking")

        }
        .onAppear {
            viewModel.fetchCoins()
            viewModel.getFavouriteCoins()
        }
    }
}

#Preview {
    HomeView()
}
