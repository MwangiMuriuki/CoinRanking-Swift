//
//  FavouritesPlaceholderView.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 14/01/2025.
//

import SwiftUI

struct FavouritesPlaceholderView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.buttonBackground)
                .frame(height: 180)
                .shadow(
                    color: .shadow.opacity(0.3),
                    radius: 10, x:0, y: 0
                )
                .overlay {
                    VStack(alignment: .center) {
                        Text("No Favourites yet")
                            .font(.custom("AvenirNext-DemiBold", size: 18))
                            .foregroundColor(.textColorPrimary)

                        Text("Add a coin to your favourites by swiping left on a coin on the previous page.")
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundColor(.textColorPrimary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)
                            .padding(.top, 10)
                    }

                }

        }
        .padding()
    }
}

#Preview {
    FavouritesPlaceholderView()
}
