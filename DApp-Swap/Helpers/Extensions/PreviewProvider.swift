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
    
    let tokenUSDT = TokenModel(id: 0, name: "USDT")
    let tokenBNB = TokenModel(id: 0, name: "BNB")
}
