import SwiftUI

struct TokenSelectButtonView: View {
    let title: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "dollarsign")
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
            Image(systemName: "greaterthan")
            Spacer()
        }
        .padding(8)
        .background(Color.theme.accent)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct TokenSelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TokenSelectButtonView(title: "USDT")
                .previewLayout(.sizeThatFits)
    }
}
