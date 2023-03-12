import SwiftUI

struct TokenImageView: View {
    @StateObject private var vm: TokenImageViewModel
    @Binding var token: TokenModel
    let width: CGFloat
    let height: CGFloat
    
    init(imageFetchingService: FileFetchingServiceProtocol, width: CGFloat, height: CGFloat, token: Binding<TokenModel>) {
        _vm = StateObject(wrappedValue: TokenImageViewModel(token: token.wrappedValue, imageFetchingService: imageFetchingService))
        self.width = width
        self.height = height
        self._token = token
    }

    var body: some View {
        ZStack {
            if let imageData = vm.imageData {
                Image(uiImage: UIImage(data: imageData)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
            } else if vm.isLoading {
                LoadingIndicator()
                    .padding(.trailing)
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.accent)
            }
        }
        .onAppear {
            Task {
                await vm.fetchImage()
            }
        }
        .onChange(of: token) { newToken in
            vm.token = newToken
            Task {
                await vm.fetchImage()
            }
        }
    }
}

struct TokenImageView_Previews: PreviewProvider {
    static let imageFetchingService = ImageFetchingService()
    
    static var previews: some View {
        TokenImageView(imageFetchingService: imageFetchingService, width: 20, height: 20, token: .constant(dev.tokenBNB))
    }
}
