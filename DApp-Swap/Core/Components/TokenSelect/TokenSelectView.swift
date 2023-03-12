//
//  TokenSelectView.swift
//  DApp-Swap
//
//  Created by Bence Borsos on 2023. 03. 12..
//

import SwiftUI

struct TokenSelectView: View {
    private let title: LocalizedStringKey = "tokenSelect"
    @Binding var tokens: [TokenModel]
    @Binding var selectedToken: TokenModel
    @Binding var showingPopover: Bool
    var body: some View {
        VStack {
            navBar
            List {
                ForEach($tokens) { token in
                    TokenRowView(token: token)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            selected(token: token)
                        }
                }
            }
            .environment(\.defaultMinListRowHeight, 30)
            .listStyle(.plain)
            .colorScheme(.light)
            Spacer()
        }
    }
}

struct TokenSelectView_Previews: PreviewProvider {
    static var previews: some View {
        TokenSelectView(tokens: .constant(dev.tokens), selectedToken: .constant(dev.tokenBNB), showingPopover: .constant(false))
    }
}

extension TokenSelectView {
    private var navBar: some View {
        ZStack {
            HStack {
                Spacer()
                VStack{
                    TitleTextView(text: title.localized())
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    showingPopover.toggle()
                }, label: {
                    Image(systemName: "x.circle")
                        .font(.system(size: 30))
                })
            }
            .padding(.trailing)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private func selected(token: Binding<TokenModel>) {
        self.$selectedToken.wrappedValue = token.wrappedValue
        showingPopover.toggle()
    }
}
