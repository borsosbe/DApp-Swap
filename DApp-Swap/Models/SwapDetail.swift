//
//  SwapDetail.swift
//  DApp-Swap
//
//  Created by Bence Borsos on 2023. 03. 12..
//

import Foundation

enum SwapDetailType {
    case exchangeRate
    case networkFees
    case priceImpact
    case swappingWith
    case gasRefund
    
    var description : String {
        switch self {
        case .exchangeRate: return "exchangeRate"
        case .networkFees: return "networkFees"
        case .priceImpact: return "priceImpact"
        case .swappingWith: return "swappingWith"
        case .gasRefund: return "gasRefund"
        }
    }
}

struct SwapDetail: Identifiable {
    let id: Int
    let type: SwapDetailType
    let info: String
}
