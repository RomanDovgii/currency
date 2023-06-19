//
//  Currency.swift
//  currency
//
//  Created by Roman Dovgii on 6/16/23.
//

import Foundation
import Alamofire


struct Currency: Codable {
    var success: Bool
    var base: String
    var date: String
    var rates = [String: Double]()
}

func apiRequest(url: String) async throws -> Currency {
    
    return try await withCheckedThrowingContinuation { continuation in
        Session.default.request(url).responseDecodable(of: Currency.self) { response in
            continuation.resume(with: response.result)
        }
    }
}
