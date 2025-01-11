//
//  ContentView.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10, content: {
                HStack {
                    Text("All Coins")
                        .font(.custom("AvenirNext-DemiBold", size: 20))

                    Spacer()
                }
                
                TableHeaderColumn()
                    .padding(.top, 5)

                Divider()
                    .padding(.top, 3)
                    .padding(.bottom, 8)


                if viewModel.coinItems.isEmpty{
                    ProgressView()
                        .padding(.top, 20)
                }
                else {
                    
                    CoinsTableView(coinsList: $viewModel.coinItems)

                }

                Spacer()

            })
            .padding()
            .navigationTitle("Coin Ranking")

        }

        .onAppear {
            viewModel.fetchCoins()
        }


    }
}

#Preview {
    HomeView()
}
