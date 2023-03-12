import Foundation
import Combine

final class SwapViewModel: BaseViewModel {
    @Published private(set) var swapDetails: [SwapDetail] = []
    @Published private(set) var refreshInProgess: Bool = false
    @Published var tokens: [TokenModel] = []
    @Published var tokenFrom: TokenModel = TokenModel()
    @Published var tokenTo: TokenModel = TokenModel()
    @Published var valueFrom: String = "0"
    @Published var valueTo: String = "0"
    
    private var cancellables = Set<AnyCancellable>()
    
    func onViewModelAppear() {
        if !refreshInProgess && tokens.isEmpty {
            loadTokens()
            mockDetails()
        }
    }
    
    func onReviewTrade() {
        HapticManager.notification(type: .success)
        print("onReviewTrade")
    }
    
    func onClose() {
        HapticManager.notification(type: .success)
        print("onClose")
    }
    
    func onChangeSwapDirection() {
        let tempToken = tokenTo
        let tempVal = valueTo
        tokenTo = tokenFrom
        valueTo = valueFrom
        tokenFrom = tempToken
        valueFrom = tempVal
    }
    
    private func loadTokens() {
        tokens = [TokenModel(id: 0, name: "USDT", url: URL(string: "https://cryptologos.cc/logos/tether-usdt-logo.png?v=024")),
                  TokenModel(id: 1, name: "BNB", url: URL(string: "https://cryptologos.cc/logos/bnb-bnb-logo.png?v=024")),
                  TokenModel(id: 2, name: "BUSD", url: URL(string: "https://cryptologos.cc/logos/binance-usd-busd-logo.png?v=024")),
        ]
        tokenFrom = tokens[0]
        tokenTo = tokens[1]
    }
    
    private func mockDetails() {
        swapDetails = [SwapDetail(id: 0, type: .exchangeRate, info: "1 USDT = 2.92 BNB"),
                       SwapDetail(id: 1, type: .networkFees, info: "0.0032 NEAR"),
                       SwapDetail(id: 2, type: .priceImpact, info: "-0.05%"),
                       SwapDetail(id: 3, type: .swappingWith, info: "Normal AMM"),
                       SwapDetail(id: 4, type: .gasRefund, info: "0% Refund"),
        ]
    }
}


