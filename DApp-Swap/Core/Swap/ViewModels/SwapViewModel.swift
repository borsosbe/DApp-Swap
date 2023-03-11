import Foundation
import Combine

final class SwapViewModel: BaseViewModel {
    @Published private(set) var tokens: [TokenModel] = []
    @Published private(set) var refreshInProgess: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func onViewModelAppear() {
        if !refreshInProgess && tokens.isEmpty {
            loadTokens()
        }
    }
    
    func close() {
        HapticManager.notification(type: .success)
        print("close")
    }
    
    private func loadTokens() {
        tokens = [TokenModel(id: 0, name: "BTC"), TokenModel(id: 1, name: "USDT")]
    }
}
