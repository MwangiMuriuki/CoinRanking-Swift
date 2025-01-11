////
////  CoinStatsCollectionView.swift
////  CoinRanking
////
////  Created by Ernest Mwangi on 11/01/2025.
////
//
//import Foundation
//import SwiftUI
//
//struct CoinStatsCollectionView: UIViewRepresentable {
//    @Binding var coinLinksList: [CoinLink]
//
//    func makeUIView(context: Context) ->  UICollectionView {
//        let collectionView = UICollectionView(frame: .zero)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.layer.cornerRadius = 10
//        collectionView.alwaysBounceVertical = true
//        collectionView.isScrollEnabled = false
//        collectionView.dataSource = context.coordinator
//        collectionView.delegate = context.coordinator
//        collectionView.register(HostingCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//        return collectionView
//    }
//
//    func updateUIView(_ uiView: UICollectionView, context: Context) {
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(coinLinksList: coinLinksList)
//    }
//
//   class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
//    @Binding var coinLinksList: [CoinLink]
//
//
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return coinLinksList.count
//        }
//
//       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HostingCollectionViewCell
//
//           let cellView = ZStack {
//
//               NavigationLink{
//
//               } label: {
//                   VStack{
//                       Text("\(coinLinksList[indexPath.row].type ?? "" )")
//                           .font(.custom("AvenirNext-Medium", size: 13))
//                           .foregroundStyle(.textColorSecondary)
//                           .frame(maxWidth: .infinity, alignment: .leading)
//
//                       RoundedRectangle(cornerRadius: 5)
//                           .fill(.contentGrey)
//                           .frame(height: 30)
//                           .shadow(radius: 1)
//                           .overlay {
//                               Text("\(coinLinksList[indexPath.row].name ?? "")")
//                                   .font(.custom("AvenirNext-Medium", size: 13))
//                                   .foregroundStyle(.textColorPrimary)
//                                   .frame(maxWidth: .infinity, alignment: .leading)
//                                   .padding(.leading, 4)
//                           }
//
//                   }
//               }
//
//           }
//
//           // Set up hosting controller for SwiftUI view
//           if cell.host == nil {
//               let controller = UIHostingController(rootView: AnyView(cellView))
//               cell.host = controller
//
//               let collCellViewContent = controller.view!
//               collCellViewContent.translatesAutoresizingMaskIntoConstraints = false
//               cell.contentView.addSubview(collCellViewContent)
//               // Configure constraints for the hosting controller's view
//               collCellViewContent.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
//               collCellViewContent.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor).isActive = true
//               collCellViewContent.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
//               collCellViewContent.rightAnchor.constraint(equalTo: cell.contentView.rightAnchor).isActive = true
//               collCellViewContent.backgroundColor = .white
//
//               collectionView.reloadData()
//           } else {
//               // Reuse existing hosting controller and update SwiftUI view
//               cell.host?.rootView = AnyView(cellView)
//           }
//
//           cell.setNeedsLayout()
//           return cell
//       }
//    }
//
//}
//
//class HostingCollectionViewCell: UICollectionViewCell { // just to hold hosting controller
//    var host: UIHostingController<AnyView>?
//}
