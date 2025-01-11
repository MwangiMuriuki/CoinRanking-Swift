//
//  CoinDetailView.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import SwiftUI
import Charts

struct CoinDetailView: View {
    @StateObject private var detailViewModel = DetailViewModel()
    @State var coinUUID: String

    var data = [
        "3268.73",
        "3286.87",
        "3295.09",
        "3301.63",
        "3305.68",
        "3307.64",
        "2301.70",
        "3282.22",
        "4257.28",
        "3238.09",
        "1245.07",
        "3270.48",
        "3295.76",
        "3286.11",
        "3276.20",
        "3266.91",
        "null"
    ]
    private var areaBackground: Gradient {
        return Gradient(colors: [Color.green, Color.accentColor.opacity(0.1)])
      }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10, content: {

                    HStack(spacing: 10, content: {
                        AsyncImage(url: URL(string: detailViewModel.singleCoinData?.iconURL ?? "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg")) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "bitcoinsign.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }

                        VStack(alignment:.leading, spacing:2, content: {
                            Text(detailViewModel.singleCoinData?.name ?? "Coin Name")
                                .font(.custom("AvenirNext-DemiBold", size: 18))
                                .foregroundStyle(.textColorPrimary)

                            HStack(spacing: 10) {
                                Text(detailViewModel.singleCoinData?.symbol ?? "CNC")
                                    .font(.custom("AvenirNext-Medium", size: 14))
                                    .foregroundStyle(.textColorSecondary)

                                Text("#\(detailViewModel.singleCoinData?.rank ?? 1)")
                                    .font(.custom("AvenirNext-Medium", size: 14))
                                    .foregroundStyle(.textColorSecondary)
                            }

                        })

                        Spacer()


                        VStack(alignment: .trailing, spacing:2, content: {
                            Text("$\(detailViewModel.singleCoinData?.price?.formattedPrice() ?? "")")
                                .font(.custom("AvenirNext-DemiBold", size: 18))
                                .foregroundStyle(.textColorPrimary)

                            if ((detailViewModel.singleCoinData?.change?.description.contains("-")) != nil) {
                                HStack(spacing:4, content: {

                                    Image(.arrowDown)
                                        .resizable()
                                        .frame(width: 11, height: 8)

                                    Text("\(detailViewModel.singleCoinData?.change ?? "" )%")
                                        .font(.custom("AvenirNext-DemiBold", size: 14))
                                        .foregroundStyle(.colorRed)

                                })
                                .frame(maxWidth: .infinity, alignment: .trailing)

                            }
                            else {
                                HStack(spacing:4, content: {
                                    Image(.arrowUp)
                                        .resizable()
                                        .frame(width: 11, height: 8)

                                    Text("\(detailViewModel.singleCoinData?.change ?? "" )%")
                                        .font(.custom("AvenirNext-DemiBold", size: 14))
                                        .foregroundStyle(.colorGreen)
                                })
                                .frame(maxWidth: .infinity, alignment: .trailing)

                            }

                        })
                    })
                    .padding(.top, 10)
                    .padding(.bottom, 20)

                    HStack{
                        Text("Price Chart")
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundStyle(.textColorPrimary)

                        Spacer()

                        Text("$\(detailViewModel.singleCoinData?.price?.formattedPrice() ?? "")")
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundStyle(.textColorPrimary)
                    }

                    Divider()
                        .padding(.top, 1)
                        .padding(.bottom, 8)

                    PriceChartView(chartValues: detailViewModel.singleCoinData?.sparkline ?? data)
                        .frame(height: 200)


                    VStack(spacing: 10) {
                        Text("Overview")
                            .font(.custom("AvenirNext-DemiBold", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("\(detailViewModel.singleCoinData?.description ?? "")")
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundStyle(.textColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // SOCIALS
                        Text("Socials and Links")
                            .font(.custom("AvenirNext-DemiBold", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(spacing: 5) {
//                            CoinStatsCollectionView(coinLinksList: $detailViewModel.singleCoinData.links)
//                                .padding()

                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.contentGrey, lineWidth: 1)
                        }


                        // STATS GRID VIEW
                        Text("Stats")
                            .font(.custom("AvenirNext-DemiBold", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Divider()
                            .padding(.bottom, 8)

                        Grid() {
                            GridRow {
                                Text("Market Cap")
                                    .font(.custom("AvenirNext-Medium", size: 13))
                                    .foregroundStyle(.textColorSecondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text("$ \(detailViewModel.singleCoinData?.marketCap?.formattedPrice() ?? "")")
                                    .font(.custom("AvenirNext-Medium", size: 13))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }

                            Divider()
                                .padding(.bottom, 5)

                            GridRow {
                                Text("Fully Diluted Valuation")
                                    .font(.custom("AvenirNext-Medium", size: 13))
                                    .foregroundStyle(.textColorSecondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text("$ \(detailViewModel.singleCoinData?.marketCap?.formattedPrice() ?? "")")
                                    .font(.custom("AvenirNext-DemiBold", size: 13))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }

                            Divider()
                                .padding(.bottom, 5)

                            GridRow {
                                Text("Trading Volume")
                                    .font(.custom("AvenirNext-Medium", size: 13))
                                    .foregroundStyle(.textColorSecondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text("$ \(detailViewModel.singleCoinData?.the24HVolume?.formattedPrice() ?? "")")
                                    .font(.custom("AvenirNext-DemiBold", size: 13))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }

                            Divider()
                                .padding(.bottom, 5)

                            GridRow {
                                Text("Exchange Listings")
                                    .font(.custom("AvenirNext-Medium", size: 13))
                                    .foregroundStyle(.textColorSecondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text("\(detailViewModel.singleCoinData?.numberOfExchanges ?? 0)")
                                    .font(.custom("AvenirNext-DemiBold", size: 13))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }

                            Divider()
                                .padding(.bottom, 5)

                        }


                    }
                    .padding(.top, 10)

                    Spacer()
                })
                .padding()
            }

        }
        .onAppear {
            detailViewModel.fetchCoinData(passedUUID: coinUUID )
        }

        if detailViewModel.isLoading {
            ZStack {
                Color(.white)
                    .opacity(0.3)
                    .ignoresSafeArea()

                ProgressView("Fetching Your Data...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .progressViewStyle(.circular)
                    .scaleEffect(1.1)
                    .padding()

            }
        }
    }
}

//#Preview {
//    CoinDetailView()
//}

