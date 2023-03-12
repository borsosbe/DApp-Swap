import SwiftUI

struct TokenSelectButtonView: View {
    @Binding var token: TokenModel
    
    var body: some View {
        HStack {
            Spacer()
            TokenImageView(imageFetchingService: ImageFetchingService(), width: 20, height: 20, token: $token)
            Text(token.name)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
            Image(systemName: "greaterthan")
            Spacer()
        }
        .fixedSize()
        .padding(8)
        .background(Color.theme.accent)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct TokenSelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TokenSelectButtonView(token: .constant(dev.tokenBNB))
            .previewLayout(.sizeThatFits)
    }
}
