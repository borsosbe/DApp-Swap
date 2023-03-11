import SwiftUI

struct SwapPanelView: View {
    let token: TokenModel
    let from: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                tokenSelect
                value
                balance
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
        }
        .background(Color.theme.background)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.theme.accent, lineWidth: 2)
        )
        .dynamicTypeSize(.small ... .xLarge)
    }
}

struct SwapPanelView_Previews: PreviewProvider {
    static var previews: some View {
        SwapPanelView(token: dev.tokenUSDT, from: true)
    }
}

extension SwapPanelView {
    private var tokenSelect: some View {
        HStack {
            CustomTextView(text: from ? "Swap from" : "To", font: .title2, fontWeight: .bold)
            Spacer()
            TokenSelectButtonView(title: token.name)
                .frame(maxWidth: 180, maxHeight: 70, alignment: .trailing)
        }
    }
    private var value: some View {
        HStack {
            CustomTextView(text: "0.567", font: .title2, fontWeight: .bold)
            Spacer()
            if from {
                RoundedButtonView(title: "Max", fill: false)
                    .frame(maxWidth: 70, maxHeight: 10, alignment: .trailing)
            }
        }
    }
    private var balance: some View {
        HStack {
            CustomTextView(text: "Balance: 3.2212312312312231231233 \(token.name)", font: .caption, fontWeight: .light, textColor: Color.theme.gray)
            Image(systemName: "equal.circle.fill")
                .font(.body)
                .foregroundColor(Color.theme.gray)
            CustomTextView(text: "$ 12231321", font: .caption, fontWeight: .light, textColor: Color.theme.gray)
            Spacer()
        }
    }
}
