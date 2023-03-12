import SwiftUI

struct SwapPanelView: View {
    @Binding var tokens: [TokenModel]
    @Binding var showingPopover: Bool
    @Binding var token: TokenModel
    @Binding var swapValue: String
    private let swapFromText: LocalizedStringKey = "swapTitle"
    private let swapToText: LocalizedStringKey = "swapTo"
    private let maxText: LocalizedStringKey = "max"
    private let balanceText: LocalizedStringKey = "balance"
    let from: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            tokenSelect
            value
            balance
        }
        .frame(minHeight: 160)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
        .background(Color.theme.background)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.theme.accent, lineWidth: 2)
                .padding(4)
        )
    }
}

struct SwapPanelView_Previews: PreviewProvider {
    static var previews: some View {
        SwapPanelView(tokens: .constant(dev.tokens), showingPopover: .constant(false), token: .constant(dev.tokenUSDT), swapValue: .constant("0.567"), from: true)
    }
}

extension SwapPanelView {
    private var tokenSelect: some View {
        HStack {
            CustomTextView(text: from ? swapFromText.localized() : swapToText.localized(), font: .title2, fontWeight: .bold)
            Spacer()
            Button(action: {
                showingPopover.toggle()
            }, label: {
                TokenSelectButtonView(token: $token)
                    .frame(alignment: .trailing)
            })
            
        }
    }
    private var value: some View {
        HStack {
            TextField("", text: $swapValue)
                .keyboardType(.numberPad)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 5)
                .foregroundColor(Color.theme.text)
                .onTapGesture {
                    if swapValue == "0" {
                        swapValue = ""
                    }
                }
            Spacer()
            if from {
                Button(action: {
                    // TODO max
                }, label: {
                    RoundedButtonView(title: maxText.localized(), fill: false)
                        .frame(maxWidth: 70, maxHeight: 10, alignment: .trailing)
                })
                
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        
    }
    private var balance: some View {
        HStack {
            CustomTextView(text: "\(balanceText.localized()) 3.2212312312312231 \(token.name)", font: .caption, fontWeight: .light, textColor: Color.theme.gray)
            Image(systemName: "equal.circle.fill")
                .font(.body)
                .foregroundColor(Color.theme.gray)
            CustomTextView(text: "$ 12231321", font: .caption, fontWeight: .light, textColor: Color.theme.gray)
            Spacer()
        }
    }
}
