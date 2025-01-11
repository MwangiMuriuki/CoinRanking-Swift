//
//  TableHeaderColumn.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 10/01/2025.
//

import SwiftUI

struct TableHeaderColumn: View {
    var body: some View {
        HStack {
            Text("#")
                .font(.custom("AvenirNext-Medium", size: 14))
                .foregroundStyle(.textColorSecondary)
                .padding(.trailing, 2)
                .frame(width: 34, alignment: .leading)

            Text("Coin")
                .font(.custom("AvenirNext-Medium", size: 14))
                .foregroundStyle(.textColorSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Text("Price")
                .font(.custom("AvenirNext-Medium", size: 14))
                .foregroundStyle(.textColorSecondary)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity, alignment: .trailing)


            Spacer()

            Text("24H")
                .font(.custom("AvenirNext-Medium", size: 14))
                .foregroundStyle(.textColorSecondary)
                .frame(maxWidth: .infinity, alignment: .trailing)

        }
        .padding(.leading, 5)
        .padding(.trailing, 14)
    }
}

#Preview {
    TableHeaderColumn()
}
