//
//  CoinsTableView.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import Foundation
import SwiftUI
import SDWebImageSVGCoder
import SDWebImage
import SDWebImageSwiftUI
import WebKit

struct CoinsTableView: UIViewRepresentable {
    @Binding var coinsList: [CoinData]
    @Binding var sortingOption: SortingOption
    @ObservedObject var homeViewModel = HomeViewModel()

    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 10
        tableView.alwaysBounceVertical = true
        tableView.isScrollEnabled = true
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(HostingCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }

    func updateUIView(_ uiView: UITableView, context: Context) {
        DispatchQueue.main.async {
            uiView.reloadData()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(coinsList: $coinsList, sortingOption: $sortingOption, homeViewModel: homeViewModel)
    }

    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        @Binding var coinsList: [CoinData]
        @Binding var sortingOption: SortingOption
        @ObservedObject var homeViewModel: HomeViewModel

        init(coinsList: Binding<[CoinData]>, sortingOption: Binding<SortingOption>, homeViewModel: HomeViewModel) {
            self._coinsList = coinsList
            self._sortingOption = sortingOption
            self.homeViewModel = homeViewModel
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.coinsList.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let coinCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HostingCell

            // Configure the SwiftUI view inside the TableViewCell
            let view = ZStack {

                NavigationLink {
                    CoinDetailView(coinUUID: coinsList[indexPath.row].uuid ?? "")
                        .navigationTitle("Coin Details")
                } label: {
                    HStack(spacing: 0, content: {
                        Text("\(coinsList[indexPath.row].rank ?? 1)")
                            .font(.custom("AvenirNext-Medium", size: 13))
                            .foregroundStyle(.textColorSecondary)
                            .padding(.trailing, 2)
                            .frame(width: 34, alignment: .leading)


                        AsyncImage(url: URL(string: coinsList[indexPath.row].iconURL ?? "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg")) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 24, height: 24)
                                .clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "bitcoinsign.circle.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 24, height: 24)
                        }
                        .padding(.trailing, 5)

//                        if coinsList[indexPath.row].iconURL?.contains(".svg") == true{
//                            WebImage(url: URL(string: coinsList[indexPath.row].iconURL ?? ""))
//                                .resizable()
//                                .frame(width: 24, height: 24)
//                                .border(.textColorPrimary, width: 1)
//                                .clipShape(Circle())
//                                .padding(.trailing, 5)
//                        }
//                        else {
//                            AsyncImage(url: URL(string: coinsList[indexPath.row].iconURL ?? "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg")) { image in
//                                image.resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 24, height: 24)
//                                    .clipShape(Circle())
//                            } placeholder: {
//                                Image(systemName: "bitcoinsign.circle.fill")
//                                    .resizable()
//                                    .frame(width: 24, height: 24)
//                            }
//                            .padding(.trailing, 5)
//                        }

//                        WebView(request: URLRequest(url: URL(string: coinsList[indexPath.row].iconURL ?? "")!))
//                            .frame(width: 24, height: 24)
//                            .padding(.trailing, 5)
////
//                        WKWebView(url: URL(string: coinsList[indexPath.row].iconURL ?? ""))
//                            .frame(width: 24, height: 24)
//                            .padding(.trailing, 5)


                        VStack(alignment:.leading, spacing:2, content: {
                            Text(coinsList[indexPath.row].name ?? "CoinRank")
                                .font(.custom("AvenirNext-DemiBold", size: 13))
                                .foregroundStyle(.textColorPrimary)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text(coinsList[indexPath.row].symbol ?? "CR")
                                .font(.custom("AvenirNext", size: 13))
                                .foregroundStyle(.textColorSecondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        })
                        .frame(maxWidth: .infinity,  alignment: .leading)



                        Spacer()

                        Text("$\(coinsList[indexPath.row].price?.formattedPrice() ?? "$0.00")")
                            .font(.custom("AvenirNext-DemiBold", size: 13))
                            .foregroundStyle(.textColorPrimary)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .trailing)


                        Spacer()

                        if coinsList[indexPath.row].change!.description.contains("-") {
                            HStack(spacing:4, content: {

                                Image(.arrowDown)
                                    .resizable()
                                    .frame(width: 10, height: 6)

                                Text("\(coinsList[indexPath.row].change ?? "" )%")
                                    .font(.custom("AvenirNext-DemiBold", size: 13))
                                    .foregroundStyle(.colorRed)

                            })
                            .frame(maxWidth: .infinity, alignment: .trailing)


                        }
                        else {
                            HStack(spacing:4, content: {
                                Image(.arrowUp)
                                    .resizable()
                                    .frame(width: 10, height: 6)

                                Text("\(coinsList[indexPath.row].change ?? "" )%")
                                    .font(.custom("AvenirNext-DemiBold", size: 13))
                                    .foregroundStyle(.colorGreen)
                            })
                            .frame(maxWidth: .infinity, alignment: .trailing)


                        }

                    })
                    .padding(.bottom, 20)
                }

            }

            // Set up hosting controller for SwiftUI view
            if coinCell.host == nil {
                let controller = UIHostingController(rootView: AnyView(view))
                coinCell.host = controller

                let tableCellViewContent = controller.view!
                tableCellViewContent.translatesAutoresizingMaskIntoConstraints = false
                coinCell.contentView.addSubview(tableCellViewContent)
                // Configure constraints for the hosting controller's view
                tableCellViewContent.topAnchor.constraint(equalTo: coinCell.contentView.topAnchor).isActive = true
                tableCellViewContent.leftAnchor.constraint(equalTo: coinCell.contentView.leftAnchor).isActive = true
                tableCellViewContent.bottomAnchor.constraint(equalTo: coinCell.contentView.bottomAnchor).isActive = true
                tableCellViewContent.rightAnchor.constraint(equalTo: coinCell.contentView.rightAnchor).isActive = true

                tableView.reloadData()
            } else {
                // Reuse existing hosting controller and update SwiftUI view
                coinCell.host?.rootView = AnyView(view)
            }
            coinCell.setNeedsLayout()
            return coinCell

        }

        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
        -> UISwipeActionsConfiguration? {
            let favouriteAction = UIContextualAction(style: .normal, title: nil) { action, view, completionHandler in
//                self.homeViewModel.favouritesService(coin: self.coinsList[indexPath.row])
                self.homeViewModel.addCoinEntity(coinData: self.coinsList[indexPath.row])

                completionHandler(true)
            }
            favouriteAction.image = UIImage(systemName: "heart")
            favouriteAction.backgroundColor = .colorGreen
            let configuration = UISwipeActionsConfiguration(actions: [favouriteAction])
            return configuration
        }

        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

            if indexPath.row == self.coinsList.count - 1 {
                if self.homeViewModel.pageLimit < 100 {
                    homeViewModel.pageLimit = homeViewModel.pageLimit + 20
                    print("Limit: \(self.homeViewModel.pageLimit)")
                    DispatchQueue.main.async {
                        self.homeViewModel.fetchCoins()
                    }
                }
                else {
                    print("Limit Reached")
                }

            }

        }

    }
}

class HostingCell: UITableViewCell { // just to hold hosting controller
    var host: UIHostingController<AnyView>?
}
