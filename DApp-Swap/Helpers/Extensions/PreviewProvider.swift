import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let tokens: [TokenModel] = [TokenModel(id: 0, name: "USDT", url: URL(string: "https://cryptologos.cc/logos/tether-usdt-logo.png?v=024")),
                                TokenModel(id: 1, name: "BNB", url: URL(string: "https://cryptologos.cc/logos/bnb-bnb-logo.png?v=024"))]
    let tokenUSDT = TokenModel(id: 0, name: "USDT", url: URL(string: "https://cryptologos.cc/logos/tether-usdt-logo.png?v=024"))
    let tokenBNB = TokenModel(id: 1, name: "BNB", url: URL(string: "https://cryptologos.cc/logos/bnb-bnb-logo.png?v=024"))
    let swapDetail : SwapDetail = SwapDetail(id: 0, type: .exchangeRate, info: "1 USDT = 2.92 BNB")
    let swapDetails : [SwapDetail] = [SwapDetail(id: 0, type: .exchangeRate, info: "1 USDT = 2.92 BNB"),
                                      SwapDetail(id: 1, type: .networkFees, info: "0.0032 NEAR")]
}
