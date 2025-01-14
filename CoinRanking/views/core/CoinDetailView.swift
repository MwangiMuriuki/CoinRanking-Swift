//
//  CoinDetailView.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import SwiftUI
import Charts
import SDWebImageSVGCoder
import SDWebImage
import SDWebImageSwiftUI

struct CoinDetailView: View {
    @ObservedObject private var detailViewModel = DetailViewModel()
    @State var coinUUID: String
//    @State var chartData: [String?]

    private var areaBackground: Gradient {
        return Gradient(colors: [Color.green, Color.accentColor.opacity(0.1)])
    }

    var body: some View {
        NavigationView {

            ScrollView {

//                if detailViewModel.isLoading {
//                    ZStack {
//                        Color(.white)
//                            .opacity(0.3)
//                            .ignoresSafeArea()
//
//                        ProgressView("Fetching Your Data...")
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .progressViewStyle(.circular)
//                            .scaleEffect(1.1)
//                            .padding()
//
//                    }
//                }
//                else {
//                    VStack(alignment: .leading, spacing: 10, content: {
//
//                        HStack(spacing: 10, content: {
//
//    //                        FetchedImage(url: URL(string: detailViewModel.singleCoinData?.iconURL ?? "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg"), placeholder: { Image(systemName: "bitcoinsign.circle.fill") }) { image in
//    //                            image
//    //                                .resizable()
//    //                                .frame(width: 40, height: 40)
//    //                        }
//
//    //                        FetchedImage(url: detailViewModel.singleCoinData?.iconURL ?? "", placeholder: "")
//
//                            Circle()
//                                .frame(width: 40, height: 40)
//                                .foregroundStyle(.buttonBackground)
//                                .overlay {
//                                    WebImage(url: URL(string: detailViewModel.singleCoinData?.iconURL ?? ""))
//                                        .resizable()
//                                        .frame(width: 40, height: 40)
//                                        .clipShape(Circle())
//                                }
//                                .shadow(
//                                    color: .shadow.opacity(0.5),
//                                    radius: 5, x:0, y: 0
//                                )
//
//
//
//                            VStack(alignment:.leading, spacing:2, content: {
//                                Text(detailViewModel.singleCoinData?.name ?? "Coin Name")
//                                    .font(.custom("AvenirNext-DemiBold", size: 18))
//                                    .foregroundStyle(.textColorPrimary)
//
//                                HStack(spacing: 10) {
//                                    Text(detailViewModel.singleCoinData?.symbol ?? "CNC")
//                                        .font(.custom("AvenirNext-Medium", size: 14))
//                                        .foregroundStyle(.textColorSecondary)
//
//                                    Text("#\(detailViewModel.singleCoinData?.rank ?? 1)")
//                                        .font(.custom("AvenirNext-Medium", size: 14))
//                                        .foregroundStyle(.textColorSecondary)
//                                }
//
//                            })
//
//                            Spacer()
//
//
//                            VStack(alignment: .trailing, spacing:2, content: {
//                                Text("$\(detailViewModel.singleCoinData?.price?.formattedPrice() ?? "")")
//                                    .font(.custom("AvenirNext-DemiBold", size: 18))
//                                    .foregroundStyle(.textColorPrimary)
//
//                                if ((detailViewModel.singleCoinData?.change?.description.contains("-")) != nil) {
//                                    HStack(spacing:4, content: {
//
//                                        Image(.arrowDown)
//                                            .resizable()
//                                            .frame(width: 11, height: 8)
//
//                                        Text("\(detailViewModel.singleCoinData?.change ?? "" )%")
//                                            .font(.custom("AvenirNext-DemiBold", size: 14))
//                                            .foregroundStyle(.colorRed)
//
//                                    })
//                                    .frame(maxWidth: .infinity, alignment: .trailing)
//
//                                }
//                                else {
//                                    HStack(spacing:4, content: {
//                                        Image(.arrowUp)
//                                            .resizable()
//                                            .frame(width: 11, height: 8)
//
//                                        Text("\(detailViewModel.singleCoinData?.change ?? "" )%")
//                                            .font(.custom("AvenirNext-DemiBold", size: 14))
//                                            .foregroundStyle(.colorGreen)
//                                    })
//                                    .frame(maxWidth: .infinity, alignment: .trailing)
//
//                                }
//
//                            })
//                        })
//                        .padding(.top, 10)
//                        .padding(.bottom, 20)
//
//                        HStack{
//                            Text("Price Chart")
//                                .font(.custom("AvenirNext-Medium", size: 15))
//                                .foregroundStyle(.textColorPrimary)
//
//                            Spacer()
//
//                            Text("$\(detailViewModel.singleCoinData?.price?.formattedPrice() ?? "")")
//                                .font(.custom("AvenirNext-Medium", size: 15))
//                                .foregroundStyle(.textColorPrimary)
//                        }
//
//                        Divider()
//                            .padding(.top, 1)
//                            .padding(.bottom, 8)
//
//                        // MARK: - Chart
//
//                        PriceChartView(detailViewModel: detailViewModel, coinUUID: coinUUID)
//                            .padding(.top, 10)
//
//
//                        // MARK: - Overview
//                        VStack(spacing: 10) {
//                            Text("Overview")
//                                .font(.custom("AvenirNext-DemiBold", size: 20))
//                                .frame(maxWidth: .infinity, alignment: .leading)
//
//                            Text("\(detailViewModel.singleCoinData?.description ?? "")")
//                                .font(.custom("AvenirNext-Medium", size: 15))
//                                .foregroundStyle(.textColorPrimary)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//
//                            // MARK: - SOCIALS
//                            Text("Socials and Links")
//                                .font(.custom("AvenirNext-DemiBold", size: 20))
//                                .frame(maxWidth: .infinity, alignment: .leading)
//
//
//                            VStack(spacing: 5) {
//                                //                            CoinStatsCollectionView(coinLinksList: $detailViewModel.singleCoinData.links)
//                                //                                .padding()
//
//                            }
//                            .overlay {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.contentGrey, lineWidth: 1)
//                            }
//
//
//                            // MARK: - STATS GRID VIEW
//                            Text("Stats")
//                                .font(.custom("AvenirNext-DemiBold", size: 20))
//                                .frame(maxWidth: .infinity, alignment: .leading)
//
//                            Divider()
//                                .padding(.bottom, 8)
//
//                            Grid() {
//                                GridRow {
//                                    Text("Market Cap")
//                                        .font(.custom("AvenirNext-Medium", size: 13))
//                                        .foregroundStyle(.textColorSecondary)
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                                    Text("$ \(detailViewModel.singleCoinData?.marketCap?.formattedPrice() ?? "")")
//                                        .font(.custom("AvenirNext-Medium", size: 13))
//                                        .frame(maxWidth: .infinity, alignment: .trailing)
//                                }
//
//                                Divider()
//                                    .padding(.bottom, 5)
//
//                                GridRow {
//                                    Text("Fully Diluted Valuation")
//                                        .font(.custom("AvenirNext-Medium", size: 13))
//                                        .foregroundStyle(.textColorSecondary)
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                                    Text("$ \(detailViewModel.singleCoinData?.marketCap?.formattedPrice() ?? "")")
//                                        .font(.custom("AvenirNext-DemiBold", size: 13))
//                                        .frame(maxWidth: .infinity, alignment: .trailing)
//                                }
//
//                                Divider()
//                                    .padding(.bottom, 5)
//
//                                GridRow {
//                                    Text("Trading Volume")
//                                        .font(.custom("AvenirNext-Medium", size: 13))
//                                        .foregroundStyle(.textColorSecondary)
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                                    Text("$ \(detailViewModel.singleCoinData?.the24HVolume?.formattedPrice() ?? "")")
//                                        .font(.custom("AvenirNext-DemiBold", size: 13))
//                                        .frame(maxWidth: .infinity, alignment: .trailing)
//                                }
//
//                                Divider()
//                                    .padding(.bottom, 5)
//
//                                GridRow {
//                                    Text("Exchange Listings")
//                                        .font(.custom("AvenirNext-Medium", size: 13))
//                                        .foregroundStyle(.textColorSecondary)
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//
//                                    Text("\(detailViewModel.singleCoinData?.numberOfExchanges ?? 0)")
//                                        .font(.custom("AvenirNext-DemiBold", size: 13))
//                                        .frame(maxWidth: .infinity, alignment: .trailing)
//                                }
//
//                                Divider()
//                                    .padding(.bottom, 5)
//                            }
//
//                        }
//                        .padding(.top, 10)
//
//                        Spacer()
//                    })
//                    .padding()
//                }

                VStack(alignment: .leading, spacing: 10, content: {

                    HStack(spacing: 10, content: {

//                        FetchedImage(url: URL(string: detailViewModel.singleCoinData?.iconURL ?? "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg"), placeholder: { Image(systemName: "bitcoinsign.circle.fill") }) { image in
//                            image
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                        }

//                        FetchedImage(url: detailViewModel.singleCoinData?.iconURL ?? "", placeholder: "")

                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.buttonBackground)
                            .overlay {
                                WebImage(url: URL(string: detailViewModel.singleCoinData?.iconURL ?? ""))
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }
                            .shadow(
                                color: .shadow.opacity(0.5),
                                radius: 5, x:0, y: 0
                            )



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

                    // MARK: - Chart

                    PriceChartView(detailViewModel: detailViewModel, coinUUID: coinUUID, chartValues: detailViewModel.singleCoinData?.sparkline)
                        .padding(.top, 10)
                        .frame(height: 200)


                    // MARK: - Overview
                    VStack(spacing: 10) {
                        Text("Overview")
                            .font(.custom("AvenirNext-DemiBold", size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("\(detailViewModel.singleCoinData?.description ?? "")")
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundStyle(.textColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // MARK: - SOCIALS
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


                        // MARK: - STATS GRID VIEW
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
            .onAppear {
                detailViewModel.fetchCoinData(passedUUID: coinUUID)
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
}

//#Preview {
//    CoinDetailView()
//}

