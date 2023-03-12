import Foundation
import Combine

final class TokenImageViewModel: ObservableObject {
    @Published private(set) var imageData: Data? = nil
    @Published private(set) var isLoading: Bool = false
    @Published var token: TokenModel
    private let imageFetchingService: FileFetchingServiceProtocol

    init(token: TokenModel, imageFetchingService: FileFetchingServiceProtocol) {
        self.imageFetchingService = imageFetchingService
        self.token = token
    }
    
    func fetchImage() async {
        DispatchQueue.main.async {
            self.isLoading.toggle()
        }
        if let url = token.url {
            let data: Data? = try? await imageFetchingService.asyncDownload(url: url)
            await MainActor.run {
                self.imageData = data
                self.isLoading.toggle()
            }
        } else {
            print("Bad url")
        }
    }
}
