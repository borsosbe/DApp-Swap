//
//  SwapDetailRowView.swift
//  DApp-Swap
//
//  Created by Bence Borsos on 2023. 03. 12..
//

import SwiftUI

struct SwapDetailRowView: View {
    let detail: SwapDetail
    
    var body: some View {
        HStack {
            CustomTextView(text: LocalizedStringKey(detail.type.description).localized(), textColor: Color.theme.gray)
            Spacer()
            CustomTextView(text: detail.info, fontWeight: .semibold)
            switch detail.type {
            case .exchangeRate:
                Image(systemName: "arrow.right.arrow.left")
                    .foregroundColor(Color.theme.gray)
            case .priceImpact:
                Image(systemName: "bolt.fill")
                    .foregroundColor(Color.theme.gray)
            default:
                EmptyView()
            }
        }
        .frame(height: 10)
    }
}

struct SwapDetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        SwapDetailRowView(detail: dev.swapDetail)
    }
}
