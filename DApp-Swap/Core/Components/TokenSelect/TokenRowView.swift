import SwiftUI

struct TokenRowView: View {
    @Binding var token: TokenModel
    
    var body: some View {
        HStack {
            TokenImageView(imageFetchingService: ImageFetchingService(), width: 20, height: 20, token: $token)
            CustomTextView(text: token.name, textColor: Color.theme.background)
            Spacer()
        }
        .padding(8)
        .background(Color.theme.accent)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct TokenRowView_Previews: PreviewProvider {
    static var previews: some View {
        TokenRowView(token: .constant(dev.tokenBNB))
    }
}
